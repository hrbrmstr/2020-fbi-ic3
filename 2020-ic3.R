#' ---
#' title: ""
#' author: ""
#' date: ""
#' output:
#'   html_document:
#'     toc: true
#'     keep_md: true
#'     theme: simplex
#'     highlight: monochrome
#' ---
#+ init, include=FALSE
knitr::opts_chunk$set(
  message = FALSE, 
  warning = FALSE, 
  echo = FALSE,
  dev = "png", 
  collapse = TRUE,
  fig.retina = 2, 
  fig.width = 10, 
  fig.height = 6
)

#' # 2020 FBI IC3 Data Extraction script
#' 
#' Extracts tables from the 2020 FBI IC3 report (in `src/`).
#' 
#' Can just "knit" in RStudio
#' 
#' Command line use (requries pandoc>=1.12.3 on `$PATH`): `Rscript -e 'knitr::spin("2020-ic3.R", FALSE); rmarkdown::render("2020-ic3.Rmd")'`

#+ libs
library(stringi)
library(pdftools)
library(arrow)
library(fs)
library(gt)
library(jsonlite, include.only = "fromJSON")
library(xml2)
library(rvest)
library(tidyverse)

#+ data
fbi <- pdf_text("src/851104.pdf")

#' ### page 16 — 2020 victims by age group

stri_split_lines(fbi[[16]])[[1]][8:17] |> 
  stri_trim_both() |> 
  discard(`==`, "") |> 
  stri_replace_all_fixed("$", "") |> 
  stri_split_regex("[[:space:]]{3,}", simplify = TRUE) |>
  as.data.frame() |> 
  set_names(c("age_range", "total_count", "total_loss")) |> 
  type_convert(
    col_types = cols(
      age_range = col_character(),
      total_count = col_number(),
      total_loss = col_number()
    )
  ) |> 
  mutate(age_range = factor(age_range, levels = age_range)) -> pg16_victims_by_age_group

gt::gt(pg16_victims_by_age_group)
  
#' ### page 17 — top 20 international victim countries

stri_split_lines(fbi[[17]])[[1]][33:41] |> 
  stri_trim_both() |> 
  discard(`==`, "") |> 
  stri_match_all_regex(
"
([[:digit:]]{1,2})\\.  # extract the digits from the leading ##.
[[:space:]]            # looks like there's just one space for all of them
([^[:digit:]]+)        # anything that isn't a digit is the country name (trim spaces later))
([[:digit:],]+)        # the value
",
    comment = TRUE
  ) |> 
  map_df(~{
    .x[,3:4] |> 
      as.data.frame() |> 
      set_names("country", "victim_count") |> 
      type_convert(
        col_types = cols(
          country = col_character(),
          victim_count = col_number()
        )
      )
  }) -> pg17_top_20_victim_countries
  
gt::gt(pg17_top_20_victim_countries)

#+ page 19 — 2020 crime types by victm count

stri_split_lines(fbi[[19]])[[1]][10:26] |> 
  stri_trim_both() |> 
  stri_match_all_regex("([[:alpha:]][^[:space:]]+)[[:space:]]+([[:digit:],]+)") |> 
  map_df(~{
    res <- .x[,2:3]
    if (!inherits(res, "character")) {
      as.data.frame(res)
    } else {
      data.frame(
        V1 = res[1],
        V2 = res[2]
      ) 
    }
  }) |> 
  set_names("crime_type", "victim_count") |> 
  type_convert(
    col_types = cols(
      crime_type = col_character(),
      victim_count = col_number()
    )
  ) |> 
  arrange(desc(victim_count)) |> 
  mutate(
    crime_type = factor(crime_type, unique(crime_type))
  ) -> pg19_2020_crime_types_by_victim_count

gt::gt(pg19_2020_crime_types_by_victim_count)

#' ### page 20 — 2020 crime types by victim loss

stri_split_lines(fbi[[20]])[[1]][9:26] |> 
  stri_trim_both() |> 
  stri_replace_all_fixed("**", "") |> 
  stri_match_first_regex(
    "
^([^\\$]+)\\$   # from start of line, capture all non $ characters, then ignore the $
([^[:space:]]+) # capture all non 'space' characters
[[:space:]]+    # ignore all 'space' characters
([^\\$]+)\\$    # from this point forward, capture all non $ characters, then ignore the $
(.*)$           # capture everything to the end of the string
|               #     OR
^([^\\$]+)\\$   # capture all non $ characters, then ignore the $
([[:digit:],]+) # capture all numbers and digits
",
    comments = TRUE
  ) -> cols

rbind(cols[,2:3], cols[,4:5], cols[,6:7]) |> 
  as.data.frame() |> 
  set_names(c("crime_type", "loss")) |> 
  filter(!is.na(crime_type)) |> 
  mutate_all(stri_trim_both) |> 
  type_convert(
    col_types = cols(
      crime_type = col_character(),
      loss = col_number()
    )
  ) |> 
  mutate(
    crime_type = fct_reorder(crime_type, loss, identity)
  ) -> pg20_2020_crime_types_by_victim_loss

gt::gt(pg20_2020_crime_types_by_victim_loss)

# ggplot() +
#   geom_col(
#     data = pg20_2020_crime_types_by_victim_loss,
#     aes(loss, crime_type),
#     fill = "goldenrod", color = NA
#   ) +
#   scale_x_continuous(
#     expand = c(0, 0.125),
#     label = scales::dollar_format(1),
#     sec.axis = dup_axis()
#   ) +
#   labs(
#     x = NULL, y = NULL,
#     title = "2020 Victim Loss Amounts (Aggregate) by Crime Type",
#     subtitle = "2020 FBI IC3 Report"
#   ) +
#   theme_inter(grid="X", mode = "dark") +
#   theme(
#      plot.title.position = "plot"
#   ) +
#   theme(
#     axis.text.x.top = element_text(color = "white"),
#     axis.text.x.bottom = element_text(color = "white"),
#     axis.text.y.left = element_text(
#       family = c(rep(inter_pkg_prop$normal, 13), inter_pkg_prop$semibold, rep(inter_pkg_prop$normal, length(15:32)), inter_pkg_prop$semibold),
#       face = c(rep("plain", 13), "bold", rep("plain", length(15:32)), "bold"),
#       color = c(rep("gray40", 13), "#6baed6", rep("gray40", length(15:32)), "#e31a1c")
#     )
#   )

#' ### page 21 — last 3 year complaint count comparison

stri_trim_both(stri_split_lines(fbi[[21]])[[1]][9:40]) |> 
  stri_match_first_regex(
    "^([^\\d]+)([\\d,]+)\\s+([\\d,]+)\\s+(.*)"
  ) -> pg21_last_3_year_complaint_counts

pg21_last_3_year_complaint_counts[,2:5] |> 
  as.data.frame() |> 
  set_names(c("crime_type", "2020", "2019", "2018")) |> 
  mutate_all(stri_trim_both) |> 
  type_convert() |> 
  gather(year, victim_count, -crime_type) |> 
  mutate(year = as.integer(year)) |> 
  mutate(
    crime_type = fct_reorder(crime_type, victim_count, sum) |> fct_rev()
  ) -> pg21_last_3_year_complaint_counts

gt::gt(pg21_last_3_year_complaint_counts)

# ggplot() +
#   geom_area(
#     data = pg21_last_3_year_complaint_counts,
#     aes(year, victim_count, fill = crime_type),
#     color = "#2b2b2b", size = 0.125
#   ) +
#   scale_x_continuous(
#     breaks = 2018:2020
#   ) +
#   scale_y_continuous(
#     expand = c(0, 0.125),
#     label = scales::comma_format(1)
#   ) +
#   scale_fill_viridis_d(
#     name = NULL,
#     option = "plasma",
#     direction = -1
#   ) +
#   labs(
#     x = NULL, y = "Victim Count",
#     title = "2020 FBI IC3 Report: Victim Count by Crime Type",
#     subtitle = "The pandemic sure seemed to be on the side of the attackers last year."
#   ) +
#   theme_inter(grid="XY", mode = "dark") +
#   theme(legend.position = "bottom") +
#   theme(
#     axis.text.y.left = element_text(color = "white")
#   )

#' ### page 22 — last 3 year complaint loss by crime type

stri_trim_both(stri_split_lines(fbi[[22]])[[1]][8:40]) |> 
  stri_match_first_regex(
    "^([^\\$]+)\\$([^[:space:]]+)[[:space:]]+([^\\$]+)\\$([^[:space:]]+)[[:space:]]+\\$(.*)"
  ) -> pg22_last_3_year_complaint_counts_loss

pg22_last_3_year_complaint_counts_loss[,2:6] |> 
  as.data.frame() |> 
  set_names(c("crime_type", "2020", "rm", "2019", "2018")) |> 
  mutate_all(stri_trim_both) |> 
  select(-rm) |> 
  type_convert() |> 
  gather(year, loss, -crime_type) |> 
  mutate(year = as.integer(year)) |> 
  mutate(
    crime_type = fct_reorder(crime_type, loss, sum) |> fct_rev()
  ) -> pg22_last_3_year_complaint_counts_loss

gt::gt(pg22_last_3_year_complaint_counts_loss)

# ggplot() +
#   geom_area(
#     data = pg22_last_3_year_complaint_counts_loss,
#     aes(year, loss, fill = crime_type),
#     color = "black", size = 0.125
#   ) +
#   scale_x_continuous(
#     breaks = 2018:2020
#   ) +
#   scale_y_continuous(
#     expand = c(0, 0.125),
#     label = scales::dollar_format(1)
#   ) +
#   scale_fill_viridis_d(
#     name = "Crime Type",
#     option = "magma",
#     direction = -1
#   ) +
#   theme_inter(grid="XY")

# state metadata

read_html("https://simple.wikipedia.org/wiki/List_of_U.S._states_by_population") |> 
  html_table() |> 
  magrittr::extract2(1) |> 
  as_tibble() |> 
  select(state = 3, population = 4) |> 
  type_convert(
    col_types = cols(
      state = col_character(),
      population = col_number()
    )
  ) |> 
  add_row(
    state = "U.S. Minor Outlying Islands",
    population = 360 # ESTIMATE
  ) -> state_pop

#' ### page 23 — state statistics victim counts

stri_trim_both(stri_split_lines(fbi[[23]])[[1]][10:38]) |> 
  stri_match_all_regex(
    "([[:digit:]]{1,2})[[:space:]]+([^[:digit:]]+)([[:digit:],]+)"
  ) |> 
  map_df(~{
    res <- .x[,3:4]
    if (!inherits(res, "character")) {
      as.data.frame(res)
    } else {
      data.frame(
        V1 = res[1],
        V2 = res[2]
      ) 
    }
  }) |> 
  mutate_all(stri_trim_both) |>
  set_names("state", "victim_count") |> 
  type_convert(
    col_types = cols(
      state = col_character(),
      victim_count = col_number()
    )
  ) |> 
  # arrange(desc(victim_count)) |> 
  mutate(
    state = case_when(
      state == "Virgin Islands, U.S." ~ "U.S. Virgin Islands",
      TRUE ~ state
    ), 
    state = factor(state, state)
  ) -> pg23_2020_overall_state_victim_count

pg23_2020_overall_state_victim_count |> 
  left_join(state_pop) |> 
  mutate(
    per_cap = (victim_count / population) * 100000
  ) -> pg23_2020_overall_state_victim_count
  
gt::gt(pg23_2020_overall_state_victim_count)

# page 24 — state statistics losses

stri_trim_both(stri_split_lines(fbi[[24]])[[1]][9:37]) |> 
  stri_match_all_regex(
    "([[:digit:]]{1,2})[[:space:]]+([^\\$]+)\\$([[:digit:],]+)"
  ) |> 
  map_df(~{
    res <- .x[,3:4]
    if (!inherits(res, "character")) {
      as.data.frame(res)
    } else {
      data.frame(
        V1 = res[1],
        V2 = res[2]
      ) 
    }
  }) |> 
  mutate_all(stri_trim_both) |>
  set_names("state", "loss") |> 
  type_convert(
    col_types = cols(
      state = col_character(),
      loss = col_number()
    )
  ) |> 
  mutate(
    state = case_when(
      state == "Virgin Islands, U.S." ~ "U.S. Virgin Islands",
      TRUE ~ state
    ), 
    state = factor(state, state)
  ) -> pg24_2020_overall_state_losses

pg24_2020_overall_state_losses |> 
  left_join(state_pop) |> 
  mutate(
    per_cap = (loss / population) * 100000
  ) -> pg24_2020_overall_state_losses

gt::gt(pg24_2020_overall_state_losses)

#' ### page 25 — count by subject per state

stri_trim_both(stri_split_lines(fbi[[25]])[[1]][9:37]) |> 
  stri_match_all_regex(
    "([[:digit:]]{1,2})[[:space:]]+([^[:digit:]]+)([[:digit:],]+)"
  ) |> 
  map_df(~{
    res <- .x[,3:4]
    if (!inherits(res, "character")) {
      as.data.frame(res)
    } else {
      data.frame(
        V1 = res[1],
        V2 = res[2]
      ) 
    }
  }) |> 
  mutate_all(stri_trim_both) |>
  set_names("state", "subjects") |> 
  type_convert(
    col_types = cols(
      state = col_character(),
      subjects = col_number()
    )
  ) |> 
  mutate(
    state = case_when(
      state == "Virgin Islands, U.S." ~ "U.S. Virgin Islands",
      TRUE ~ state
    ), 
    state = factor(state, state)
  ) -> pg25_2020_overall_state_subjects

pg25_2020_overall_state_subjects |> 
  left_join(state_pop) |> 
  mutate(
    per_cap = (subjects / population) * 100000
  ) -> pg25_2020_overall_state_subjects

gt::gt(pg25_2020_overall_state_subjects)

#' ### page 26 — subject earnings per destination state

stri_trim_both(stri_split_lines(fbi[[26]])[[1]][9:37]) |> 
  stri_match_all_regex(
    "([[:digit:]]{1,2})[[:space:]]+([^\\$]+)\\$([[:digit:],]+)"
  ) |> 
  map_df(~{
    res <- .x[,3:4]
    if (!inherits(res, "character")) {
      as.data.frame(res)
    } else {
      data.frame(
        V1 = res[1],
        V2 = res[2]
      ) 
    }
  }) |> 
  mutate_all(stri_trim_both) |>
  set_names("state", "loss") |> 
  type_convert(
    col_types = cols(
      state = col_character(),
      loss = col_number()
    )
  ) |> 
  mutate(
    state = case_when(
      state == "Virgin Islands, U.S." ~ "U.S. Virgin Islands",
      TRUE ~ state
    ), 
    state = factor(state, state)
  ) -> pg26_2020_overall_state_earnings_per_subject

pg26_2020_overall_state_earnings_per_subject |> 
  left_join(state_pop) |> 
  mutate(
    per_cap = (loss / population) * 100000
  ) -> pg26_2020_overall_state_earnings_per_subject

gt::gt(pg26_2020_overall_state_earnings_per_subject)

##

ls(pattern = "^p.*") |> 
  walk(~{
    
    base <- gsub("_", "-", .x)
    
    write_csv(get(.x), sprintf("csv/%s.csv", base))
    write_parquet(get(.x), sprintf("parquet/%s.parquet", base))
    jsonlite::stream_out(get(.x), file(sprintf("json/%s.json", base)), verbose = FALSE)
    saveRDS(get(.x), sprintf("rds/%s.rds", base))
    
  })

#+ files
#' ### Files

fs::dir_tree(".")