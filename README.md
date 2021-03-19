---
title: ""
author: ""
date: ""
output:
  html_document:
    toc: true
    keep_md: true
    theme: simplex
    highlight: monochrome
---



# 2020 FBI IC3 Data Extraction script

Extracts tables from the 2020 FBI IC3 report (in `src/`).

Can just "knit" in RStudio

Command line use (requries pandoc>=1.12.3 on `$PATH`): `Rscript -e 'knitr::spin("2020-ic3.R", FALSE); rmarkdown::render("2020-ic3.Rmd")'`




### page 16 — 2020 victims by age group


```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ckebhihyia .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ckebhihyia .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ckebhihyia .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ckebhihyia .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ckebhihyia .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ckebhihyia .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ckebhihyia .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ckebhihyia .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ckebhihyia .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ckebhihyia .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ckebhihyia .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ckebhihyia .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#ckebhihyia .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ckebhihyia .gt_from_md > :first-child {
  margin-top: 0;
}

#ckebhihyia .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ckebhihyia .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ckebhihyia .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#ckebhihyia .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ckebhihyia .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#ckebhihyia .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ckebhihyia .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ckebhihyia .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ckebhihyia .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ckebhihyia .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ckebhihyia .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ckebhihyia .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ckebhihyia .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ckebhihyia .gt_left {
  text-align: left;
}

#ckebhihyia .gt_center {
  text-align: center;
}

#ckebhihyia .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ckebhihyia .gt_font_normal {
  font-weight: normal;
}

#ckebhihyia .gt_font_bold {
  font-weight: bold;
}

#ckebhihyia .gt_font_italic {
  font-style: italic;
}

#ckebhihyia .gt_super {
  font-size: 65%;
}

#ckebhihyia .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="ckebhihyia" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">age_range</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">total_count</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">total_loss</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_center">Under 20</td>
      <td class="gt_row gt_right">23186</td>
      <td class="gt_row gt_right">70980763</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">20 - 29</td>
      <td class="gt_row gt_right">70791</td>
      <td class="gt_row gt_right">197402240</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">30 - 39</td>
      <td class="gt_row gt_right">88364</td>
      <td class="gt_row gt_right">492176845</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">40 - 49</td>
      <td class="gt_row gt_right">91568</td>
      <td class="gt_row gt_right">717161726</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">50 - 59</td>
      <td class="gt_row gt_right">85967</td>
      <td class="gt_row gt_right">847948101</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Over 60</td>
      <td class="gt_row gt_right">105301</td>
      <td class="gt_row gt_right">966062236</td>
    </tr>
  </tbody>
  
  
</table></div>
```

### page 17 — top 20 international victim countries


```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#okzkrixisd .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#okzkrixisd .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#okzkrixisd .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#okzkrixisd .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#okzkrixisd .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#okzkrixisd .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#okzkrixisd .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#okzkrixisd .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#okzkrixisd .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#okzkrixisd .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#okzkrixisd .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#okzkrixisd .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#okzkrixisd .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#okzkrixisd .gt_from_md > :first-child {
  margin-top: 0;
}

#okzkrixisd .gt_from_md > :last-child {
  margin-bottom: 0;
}

#okzkrixisd .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#okzkrixisd .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#okzkrixisd .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#okzkrixisd .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#okzkrixisd .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#okzkrixisd .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#okzkrixisd .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#okzkrixisd .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#okzkrixisd .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#okzkrixisd .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#okzkrixisd .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#okzkrixisd .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#okzkrixisd .gt_left {
  text-align: left;
}

#okzkrixisd .gt_center {
  text-align: center;
}

#okzkrixisd .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#okzkrixisd .gt_font_normal {
  font-weight: normal;
}

#okzkrixisd .gt_font_bold {
  font-weight: bold;
}

#okzkrixisd .gt_font_italic {
  font-style: italic;
}

#okzkrixisd .gt_super {
  font-size: 65%;
}

#okzkrixisd .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="okzkrixisd" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">country</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">victim_count</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">United Kingdom</td>
      <td class="gt_row gt_right">216633</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">South Africa</td>
      <td class="gt_row gt_right">1754</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Brazil</td>
      <td class="gt_row gt_right">951</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Nigeria</td>
      <td class="gt_row gt_right">443</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Canada</td>
      <td class="gt_row gt_right">5399</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">France</td>
      <td class="gt_row gt_right">1640</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Philippines</td>
      <td class="gt_row gt_right">898</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Pakistan</td>
      <td class="gt_row gt_right">443</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">India</td>
      <td class="gt_row gt_right">2930</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Germany</td>
      <td class="gt_row gt_right">1578</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Italy</td>
      <td class="gt_row gt_right">728</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">China</td>
      <td class="gt_row gt_right">442</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Greece</td>
      <td class="gt_row gt_right">2314</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Mexico</td>
      <td class="gt_row gt_right">1164</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Spain</td>
      <td class="gt_row gt_right">618</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Colombia</td>
      <td class="gt_row gt_right">418</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Australia</td>
      <td class="gt_row gt_right">1807</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Belgium</td>
      <td class="gt_row gt_right">1023</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Netherlands</td>
      <td class="gt_row gt_right">450</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Hong Kong</td>
      <td class="gt_row gt_right">407</td>
    </tr>
  </tbody>
  
  
</table></div>
```

```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ryhxywkfxi .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ryhxywkfxi .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ryhxywkfxi .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ryhxywkfxi .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ryhxywkfxi .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ryhxywkfxi .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ryhxywkfxi .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ryhxywkfxi .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ryhxywkfxi .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ryhxywkfxi .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ryhxywkfxi .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ryhxywkfxi .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#ryhxywkfxi .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ryhxywkfxi .gt_from_md > :first-child {
  margin-top: 0;
}

#ryhxywkfxi .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ryhxywkfxi .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ryhxywkfxi .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#ryhxywkfxi .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ryhxywkfxi .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#ryhxywkfxi .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ryhxywkfxi .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ryhxywkfxi .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ryhxywkfxi .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ryhxywkfxi .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ryhxywkfxi .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ryhxywkfxi .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ryhxywkfxi .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ryhxywkfxi .gt_left {
  text-align: left;
}

#ryhxywkfxi .gt_center {
  text-align: center;
}

#ryhxywkfxi .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ryhxywkfxi .gt_font_normal {
  font-weight: normal;
}

#ryhxywkfxi .gt_font_bold {
  font-weight: bold;
}

#ryhxywkfxi .gt_font_italic {
  font-style: italic;
}

#ryhxywkfxi .gt_super {
  font-size: 65%;
}

#ryhxywkfxi .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="ryhxywkfxi" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">crime_type</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">victim_count</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_center">Phishing/Vishing/Smishing/Pharming</td>
      <td class="gt_row gt_right">241342</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Non-Payment/Non-Delivery</td>
      <td class="gt_row gt_right">108869</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Extortion</td>
      <td class="gt_row gt_right">76741</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Breach</td>
      <td class="gt_row gt_right">45330</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Theft</td>
      <td class="gt_row gt_right">43330</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Spoofing</td>
      <td class="gt_row gt_right">28218</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Misrepresentation</td>
      <td class="gt_row gt_right">24276</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Fraud/Romance</td>
      <td class="gt_row gt_right">23751</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Violence</td>
      <td class="gt_row gt_right">20604</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">BEC/EAC</td>
      <td class="gt_row gt_right">19369</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Fraud</td>
      <td class="gt_row gt_right">17614</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Employment</td>
      <td class="gt_row gt_right">16879</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Support</td>
      <td class="gt_row gt_right">15421</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Estate/Rental</td>
      <td class="gt_row gt_right">13638</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Fee</td>
      <td class="gt_row gt_right">13020</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Impersonation</td>
      <td class="gt_row gt_right">12827</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Overpayment</td>
      <td class="gt_row gt_right">10988</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Other</td>
      <td class="gt_row gt_right">10372</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Investment</td>
      <td class="gt_row gt_right">8788</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Lottery/Sweepstakes/Inheritance</td>
      <td class="gt_row gt_right">8501</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Counterfeit</td>
      <td class="gt_row gt_right">4213</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Children</td>
      <td class="gt_row gt_right">3202</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Breach</td>
      <td class="gt_row gt_right">2794</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Ransomware</td>
      <td class="gt_row gt_right">2474</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Service/TDoS</td>
      <td class="gt_row gt_right">2018</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Malware/Scareware/Virus</td>
      <td class="gt_row gt_right">1423</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Related</td>
      <td class="gt_row gt_right">1383</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Matter</td>
      <td class="gt_row gt_right">968</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Re-shipping</td>
      <td class="gt_row gt_right">883</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Charity</td>
      <td class="gt_row gt_right">659</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Gambling</td>
      <td class="gt_row gt_right">391</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Terrorism</td>
      <td class="gt_row gt_right">65</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Hacktivist</td>
      <td class="gt_row gt_right">52</td>
    </tr>
  </tbody>
  
  
</table></div>
```

### page 20 — 2020 crime types by victim loss


```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#kaunpfmzfx .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#kaunpfmzfx .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kaunpfmzfx .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#kaunpfmzfx .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#kaunpfmzfx .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kaunpfmzfx .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kaunpfmzfx .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#kaunpfmzfx .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#kaunpfmzfx .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#kaunpfmzfx .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#kaunpfmzfx .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#kaunpfmzfx .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#kaunpfmzfx .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#kaunpfmzfx .gt_from_md > :first-child {
  margin-top: 0;
}

#kaunpfmzfx .gt_from_md > :last-child {
  margin-bottom: 0;
}

#kaunpfmzfx .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#kaunpfmzfx .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#kaunpfmzfx .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kaunpfmzfx .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#kaunpfmzfx .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kaunpfmzfx .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#kaunpfmzfx .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#kaunpfmzfx .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kaunpfmzfx .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kaunpfmzfx .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#kaunpfmzfx .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kaunpfmzfx .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#kaunpfmzfx .gt_left {
  text-align: left;
}

#kaunpfmzfx .gt_center {
  text-align: center;
}

#kaunpfmzfx .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#kaunpfmzfx .gt_font_normal {
  font-weight: normal;
}

#kaunpfmzfx .gt_font_bold {
  font-weight: bold;
}

#kaunpfmzfx .gt_font_italic {
  font-style: italic;
}

#kaunpfmzfx .gt_super {
  font-size: 65%;
}

#kaunpfmzfx .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="kaunpfmzfx" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">crime_type</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">loss</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_center">BEC/EAC</td>
      <td class="gt_row gt_right">1866642107</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Confidence Fraud/Romance</td>
      <td class="gt_row gt_right">600249821</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Investment</td>
      <td class="gt_row gt_right">336469000</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Non-Payment/Non-Delivery</td>
      <td class="gt_row gt_right">265011249</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Identity Theft</td>
      <td class="gt_row gt_right">219484699</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Spoofing</td>
      <td class="gt_row gt_right">216513728</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Real Estate/Rental</td>
      <td class="gt_row gt_right">213196082</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Personal Data Breach</td>
      <td class="gt_row gt_right">194473055</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Tech Support</td>
      <td class="gt_row gt_right">146477709</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Credit Card Fraud</td>
      <td class="gt_row gt_right">129820792</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Corporate Data Breach</td>
      <td class="gt_row gt_right">128916648</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Government Impersonation</td>
      <td class="gt_row gt_right">109938030</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Other</td>
      <td class="gt_row gt_right">101523082</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Advanced Fee</td>
      <td class="gt_row gt_right">83215405</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Extortion</td>
      <td class="gt_row gt_right">70935939</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Overpayment</td>
      <td class="gt_row gt_right">51039922</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Ransomware</td>
      <td class="gt_row gt_right">29157405</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Health Care Related</td>
      <td class="gt_row gt_right">29042515</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Civil Matter</td>
      <td class="gt_row gt_right">24915958</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Misrepresentation</td>
      <td class="gt_row gt_right">19707242</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Malware/Scareware/Virus</td>
      <td class="gt_row gt_right">6904054</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Harassment/Threats Violence</td>
      <td class="gt_row gt_right">6547449</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">IPR/Copyright/Counterfeit</td>
      <td class="gt_row gt_right">5910617</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Charity</td>
      <td class="gt_row gt_right">4428766</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Gambling</td>
      <td class="gt_row gt_right">3961508</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Re-shipping</td>
      <td class="gt_row gt_right">3095265</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Crimes Against Children</td>
      <td class="gt_row gt_right">660044</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Denial of Service/TDos</td>
      <td class="gt_row gt_right">512127</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Hacktivist</td>
      <td class="gt_row gt_right">50</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Terrorism</td>
      <td class="gt_row gt_right">0</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Employment</td>
      <td class="gt_row gt_right">62314015</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Lottery/Sweepstakes/Inheritance</td>
      <td class="gt_row gt_right">61111319</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Phishing/Vishing/Smishing/Pharming</td>
      <td class="gt_row gt_right">54241075</td>
    </tr>
  </tbody>
  
  
</table></div>
```

### page 21 — last 3 year complaint count comparison


```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#gwsxkcexyl .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#gwsxkcexyl .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#gwsxkcexyl .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#gwsxkcexyl .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#gwsxkcexyl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gwsxkcexyl .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#gwsxkcexyl .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#gwsxkcexyl .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#gwsxkcexyl .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#gwsxkcexyl .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#gwsxkcexyl .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#gwsxkcexyl .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#gwsxkcexyl .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#gwsxkcexyl .gt_from_md > :first-child {
  margin-top: 0;
}

#gwsxkcexyl .gt_from_md > :last-child {
  margin-bottom: 0;
}

#gwsxkcexyl .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#gwsxkcexyl .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#gwsxkcexyl .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#gwsxkcexyl .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#gwsxkcexyl .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#gwsxkcexyl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#gwsxkcexyl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#gwsxkcexyl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gwsxkcexyl .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#gwsxkcexyl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#gwsxkcexyl .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#gwsxkcexyl .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#gwsxkcexyl .gt_left {
  text-align: left;
}

#gwsxkcexyl .gt_center {
  text-align: center;
}

#gwsxkcexyl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#gwsxkcexyl .gt_font_normal {
  font-weight: normal;
}

#gwsxkcexyl .gt_font_bold {
  font-weight: bold;
}

#gwsxkcexyl .gt_font_italic {
  font-style: italic;
}

#gwsxkcexyl .gt_super {
  font-size: 65%;
}

#gwsxkcexyl .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="gwsxkcexyl" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">crime_type</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">victim_count</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_center">BEC/EAC</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">19369</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Charity</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">659</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Civil Matter</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">968</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Confidence Fraud/Romance</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">23751</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Corporate Data Breach</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">2794</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Credit Card Fraud</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">17614</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Crimes Against Children</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">3202</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Denial of Service/TDoS</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">2018</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Employment</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">16879</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Extortion</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">76741</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Gambling</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">391</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Government Impersonation</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">12827</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Hacktivist</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">52</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Harassment/Threats of Violence</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">20604</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Health Care Related</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">1383</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Identity Theft</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">43330</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Investment</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">8788</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">IPR/Copyright and Counterfeit</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">4213</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Lottery/Sweepstakes/Inheritance</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">8501</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Malware/Scareware/Virus</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">1423</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Misrepresentation</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">24276</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Non-Payment/Non-Delivery</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">108869</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Other</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">10372</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Overpayment</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">10988</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Personal Data Breach</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">45330</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Phishing/Vishing/Smishing/Pharming</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">241342</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Ransomware</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">2474</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Real Estate/Rental</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">13638</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Re-Shipping</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">883</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Spoofing</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">28218</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Tech Support</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">15421</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Terrorism</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">65</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">BEC/EAC</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">23775</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Charity</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">407</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Civil Matter</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">908</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Confidence Fraud/Romance</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">19473</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Corporate Data Breach</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">1795</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Credit Card Fraud</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">14378</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Crimes Against Children</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">1312</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Denial of Service/TDoS</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">1353</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Employment</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">14493</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Extortion</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">43101</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Gambling</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">262</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Government Impersonation</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">13873</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Hacktivist</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">39</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Harassment/Threats of Violence</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">15502</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Health Care Related</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">657</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Identity Theft</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">16053</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Investment</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">3999</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">IPR/Copyright and Counterfeit</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">3892</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Lottery/Sweepstakes/Inheritance</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">7767</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Malware/Scareware/Virus</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">2373</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Misrepresentation</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">5975</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Non-Payment/Non-Delivery</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">61832</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Other</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">10842</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Overpayment</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">15395</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Personal Data Breach</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">38218</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Phishing/Vishing/Smishing/Pharming</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">114702</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Ransomware</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">2047</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Real Estate/Rental</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">11677</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Re-Shipping</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">929</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Spoofing</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">25789</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Tech Support</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">13633</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Terrorism</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">61</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">BEC/EAC</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">20373</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Charity</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">493</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Civil Matter</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">768</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Confidence Fraud/Romance</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">18493</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Corporate Data Breach</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">2480</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Credit Card Fraud</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">15210</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Crimes Against Children</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">1394</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Denial of Service/TDoS</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">1799</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Employment</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">14979</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Extortion</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">51146</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Gambling</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">181</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Government Impersonation</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">10978</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Hacktivist</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">77</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Harassment/Threats of Violence</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">18415</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Health Care Related</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">337</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Identity Theft</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">16128</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Investment</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">3693</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">IPR/Copyright and Counterfeit</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">2249</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Lottery/Sweepstakes/Inheritance</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">7146</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Malware/Scareware/Virus</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">2811</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Misrepresentation</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">5959</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Non-Payment/Non-Delivery</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">65116</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Other</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">10826</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Overpayment</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">15512</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Personal Data Breach</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">50642</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Phishing/Vishing/Smishing/Pharming</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">26379</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Ransomware</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">1493</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Real Estate/Rental</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">11300</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Re-Shipping</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">907</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Spoofing</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">15569</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Tech Support</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">14408</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Terrorism</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">120</td>
    </tr>
  </tbody>
  
  
</table></div>
```

### page 22 — last 3 year complaint loss by crime type


```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#cnlmkvwfaf .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#cnlmkvwfaf .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cnlmkvwfaf .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#cnlmkvwfaf .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#cnlmkvwfaf .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cnlmkvwfaf .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cnlmkvwfaf .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#cnlmkvwfaf .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#cnlmkvwfaf .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#cnlmkvwfaf .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#cnlmkvwfaf .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#cnlmkvwfaf .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#cnlmkvwfaf .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#cnlmkvwfaf .gt_from_md > :first-child {
  margin-top: 0;
}

#cnlmkvwfaf .gt_from_md > :last-child {
  margin-bottom: 0;
}

#cnlmkvwfaf .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#cnlmkvwfaf .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#cnlmkvwfaf .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cnlmkvwfaf .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#cnlmkvwfaf .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cnlmkvwfaf .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#cnlmkvwfaf .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#cnlmkvwfaf .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cnlmkvwfaf .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cnlmkvwfaf .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#cnlmkvwfaf .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cnlmkvwfaf .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#cnlmkvwfaf .gt_left {
  text-align: left;
}

#cnlmkvwfaf .gt_center {
  text-align: center;
}

#cnlmkvwfaf .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#cnlmkvwfaf .gt_font_normal {
  font-weight: normal;
}

#cnlmkvwfaf .gt_font_bold {
  font-weight: bold;
}

#cnlmkvwfaf .gt_font_italic {
  font-style: italic;
}

#cnlmkvwfaf .gt_super {
  font-size: 65%;
}

#cnlmkvwfaf .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="cnlmkvwfaf" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">crime_type</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">loss</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_center">Advanced Fee</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">83215405</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">BEC/EAC</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">1866642107</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Charity</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">4428766</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Civil Matter</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">24915958</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Confidence Fraud/Romance</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">600249821</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Corporate Data Breach</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">128916648</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Credit Card Fraud</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">129820792</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Crimes Against Children</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">660044</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Denial of Service/TDoS</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">512127</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Employment</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">62314015</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Extortion</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">70935939</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Gambling</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">3961508</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Government Impersonation</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">109938030</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Hacktivist</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">50</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Harassment/Threats of Violence</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">6547449</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Health Care Related</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">29042515</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Identity Theft</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">219484699</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Investment</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">336469000</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">IPR/Copyright and Counterfeit</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">5910617</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Lottery/Sweepstakes/Inheritance</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">61111319</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Malware/Scareware/Virus</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">6904054</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Misrepresentation</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">19707242</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Non-Payment/Non-Delivery</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">265011249</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Other</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">101523082</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Overpayment</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">51039922</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Personal Data Breach</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">194473055</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Phishing/Vishing/Smishing/Pharming</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">54241075</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Ransomware</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">29157405</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Real Estate/Rental</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">213196082</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Re-Shipping</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">3095265</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Spoofing</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">216513728</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Tech Support</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">146477709</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Terrorism</td>
      <td class="gt_row gt_center">2020</td>
      <td class="gt_row gt_right">0</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Advanced Fee</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">100602297</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">BEC/EAC</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">1776549688</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Charity</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">2214383</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Civil Matter</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">20242867</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Confidence Fraud/Romance</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">475014032</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Corporate Data Breach</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">53398278</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Credit Card Fraud</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">111491163</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Crimes Against Children</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">975311</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Denial of Service/TDoS</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">7598198</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Employment</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">42618705</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Extortion</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">107498956</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Gambling</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">1458118</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Government Impersonation</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">124292606</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Hacktivist</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">129000</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Harassment/Threats of Violence</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">19866654</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Health Care Related</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">1128838</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Identity Theft</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">160305789</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Investment</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">222186195</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">IPR/Copyright and Counterfeit</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">10293307</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Lottery/Sweepstakes/Inheritance</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">48642332</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Malware/Scareware/Virus</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">2009119</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Misrepresentation</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">12371573</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Non-Payment/Non-Delivery</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">196563497</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Other</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">66223160</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Overpayment</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">55820212</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Personal Data Breach</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">120102501</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Phishing/Vishing/Smishing/Pharming</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">57836379</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Ransomware</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">8965847</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Real Estate/Rental</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">221365911</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Re-Shipping</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">1772692</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Spoofing</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">300478433</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Tech Support</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">54041053</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Terrorism</td>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_right">49589</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Advanced Fee</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">92271682</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">BEC/EAC</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">1297803489</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Charity</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">1006379</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Civil Matter</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">15172692</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Confidence Fraud/Romance</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">362500761</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Corporate Data Breach</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">117711989</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Credit Card Fraud</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">88991436</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Crimes Against Children</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">265996</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Denial of Service/TDoS</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">2052340</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Employment</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">45487120</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Extortion</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">83357901</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Gambling</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">926953</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Government Impersonation</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">64211765</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Hacktivist</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">77612</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Harassment/Threats of Violence</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">21903829</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Health Care Related</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">4474792</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Identity Theft</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">100429691</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Investment</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">252955320</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">IPR/Copyright and Counterfeit</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">15802011</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Lottery/Sweepstakes/Inheritance</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">60214814</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Malware/Scareware/Virus</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">7411651</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Misrepresentation</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">20000713</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Non-Payment/Non-Delivery</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">183826809</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Other</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">63126929</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Overpayment</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">53225507</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Personal Data Breach</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">148892403</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Phishing/Vishing/Smishing/Pharming</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">48241748</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Ransomware</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">3621857</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Real Estate/Rental</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">149458114</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Re-Shipping</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">1684179</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Spoofing</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">70000248</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Tech Support</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">38697026</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">Terrorism</td>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_right">10193</td>
    </tr>
  </tbody>
  
  
</table></div>
```

### page 23 — state statistics victim counts


```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#dhfyaqibdv .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#dhfyaqibdv .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#dhfyaqibdv .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#dhfyaqibdv .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#dhfyaqibdv .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#dhfyaqibdv .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#dhfyaqibdv .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#dhfyaqibdv .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#dhfyaqibdv .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#dhfyaqibdv .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#dhfyaqibdv .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#dhfyaqibdv .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#dhfyaqibdv .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#dhfyaqibdv .gt_from_md > :first-child {
  margin-top: 0;
}

#dhfyaqibdv .gt_from_md > :last-child {
  margin-bottom: 0;
}

#dhfyaqibdv .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#dhfyaqibdv .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#dhfyaqibdv .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#dhfyaqibdv .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#dhfyaqibdv .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#dhfyaqibdv .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#dhfyaqibdv .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#dhfyaqibdv .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#dhfyaqibdv .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#dhfyaqibdv .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#dhfyaqibdv .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#dhfyaqibdv .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#dhfyaqibdv .gt_left {
  text-align: left;
}

#dhfyaqibdv .gt_center {
  text-align: center;
}

#dhfyaqibdv .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#dhfyaqibdv .gt_font_normal {
  font-weight: normal;
}

#dhfyaqibdv .gt_font_bold {
  font-weight: bold;
}

#dhfyaqibdv .gt_font_italic {
  font-style: italic;
}

#dhfyaqibdv .gt_super {
  font-size: 65%;
}

#dhfyaqibdv .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="dhfyaqibdv" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">state</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">victim_count</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">population</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">per_cap</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">California</td>
      <td class="gt_row gt_right">69541</td>
      <td class="gt_row gt_right">39512223</td>
      <td class="gt_row gt_right">175.99870</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Louisiana</td>
      <td class="gt_row gt_right">5077</td>
      <td class="gt_row gt_right">4648794</td>
      <td class="gt_row gt_right">109.21112</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Florida</td>
      <td class="gt_row gt_right">53793</td>
      <td class="gt_row gt_right">21477737</td>
      <td class="gt_row gt_right">250.45935</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Utah</td>
      <td class="gt_row gt_right">4926</td>
      <td class="gt_row gt_right">3205958</td>
      <td class="gt_row gt_right">153.65142</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Texas</td>
      <td class="gt_row gt_right">38640</td>
      <td class="gt_row gt_right">28995881</td>
      <td class="gt_row gt_right">133.26031</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Oklahoma</td>
      <td class="gt_row gt_right">4785</td>
      <td class="gt_row gt_right">3956971</td>
      <td class="gt_row gt_right">120.92583</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New York</td>
      <td class="gt_row gt_right">34505</td>
      <td class="gt_row gt_right">19453561</td>
      <td class="gt_row gt_right">177.37113</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Arkansas</td>
      <td class="gt_row gt_right">4237</td>
      <td class="gt_row gt_right">3017825</td>
      <td class="gt_row gt_right">140.39913</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Illinois</td>
      <td class="gt_row gt_right">20185</td>
      <td class="gt_row gt_right">12671821</td>
      <td class="gt_row gt_right">159.29044</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Kansas</td>
      <td class="gt_row gt_right">3457</td>
      <td class="gt_row gt_right">2913314</td>
      <td class="gt_row gt_right">118.66211</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Pennsylvania</td>
      <td class="gt_row gt_right">18636</td>
      <td class="gt_row gt_right">12801989</td>
      <td class="gt_row gt_right">145.57113</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Mexico</td>
      <td class="gt_row gt_right">3427</td>
      <td class="gt_row gt_right">2096829</td>
      <td class="gt_row gt_right">163.43727</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Washington</td>
      <td class="gt_row gt_right">17229</td>
      <td class="gt_row gt_right">7614893</td>
      <td class="gt_row gt_right">226.25400</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Mississippi</td>
      <td class="gt_row gt_right">2478</td>
      <td class="gt_row gt_right">2976149</td>
      <td class="gt_row gt_right">83.26196</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Nevada</td>
      <td class="gt_row gt_right">16110</td>
      <td class="gt_row gt_right">3080156</td>
      <td class="gt_row gt_right">523.02546</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Delaware</td>
      <td class="gt_row gt_right">2230</td>
      <td class="gt_row gt_right">973764</td>
      <td class="gt_row gt_right">229.00826</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Jersey</td>
      <td class="gt_row gt_right">14829</td>
      <td class="gt_row gt_right">8882190</td>
      <td class="gt_row gt_right">166.95207</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Idaho</td>
      <td class="gt_row gt_right">2209</td>
      <td class="gt_row gt_right">1787065</td>
      <td class="gt_row gt_right">123.61050</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Maryland</td>
      <td class="gt_row gt_right">14804</td>
      <td class="gt_row gt_right">6045680</td>
      <td class="gt_row gt_right">244.86906</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Nebraska</td>
      <td class="gt_row gt_right">2166</td>
      <td class="gt_row gt_right">1934408</td>
      <td class="gt_row gt_right">111.97224</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Virginia</td>
      <td class="gt_row gt_right">13770</td>
      <td class="gt_row gt_right">8535519</td>
      <td class="gt_row gt_right">161.32587</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">District of Columbia</td>
      <td class="gt_row gt_right">2132</td>
      <td class="gt_row gt_right">705749</td>
      <td class="gt_row gt_right">302.09040</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Ohio</td>
      <td class="gt_row gt_right">13421</td>
      <td class="gt_row gt_right">11689100</td>
      <td class="gt_row gt_right">114.81637</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Alaska</td>
      <td class="gt_row gt_right">2073</td>
      <td class="gt_row gt_right">731545</td>
      <td class="gt_row gt_right">283.37286</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Georgia</td>
      <td class="gt_row gt_right">13402</td>
      <td class="gt_row gt_right">10617423</td>
      <td class="gt_row gt_right">126.22649</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Hampshire</td>
      <td class="gt_row gt_right">2015</td>
      <td class="gt_row gt_right">1359711</td>
      <td class="gt_row gt_right">148.19326</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Arizona</td>
      <td class="gt_row gt_right">13009</td>
      <td class="gt_row gt_right">7278717</td>
      <td class="gt_row gt_right">178.72655</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Hawaii</td>
      <td class="gt_row gt_right">1978</td>
      <td class="gt_row gt_right">1415872</td>
      <td class="gt_row gt_right">139.70189</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Indiana</td>
      <td class="gt_row gt_right">12786</td>
      <td class="gt_row gt_right">6732219</td>
      <td class="gt_row gt_right">189.92252</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">West Virginia</td>
      <td class="gt_row gt_right">1902</td>
      <td class="gt_row gt_right">1792147</td>
      <td class="gt_row gt_right">106.12969</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Michigan</td>
      <td class="gt_row gt_right">12521</td>
      <td class="gt_row gt_right">9986857</td>
      <td class="gt_row gt_right">125.37478</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Puerto Rico</td>
      <td class="gt_row gt_right">1886</td>
      <td class="gt_row gt_right">3193694</td>
      <td class="gt_row gt_right">59.05387</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Colorado</td>
      <td class="gt_row gt_right">12325</td>
      <td class="gt_row gt_right">5758736</td>
      <td class="gt_row gt_right">214.02266</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Rhode Island</td>
      <td class="gt_row gt_right">1677</td>
      <td class="gt_row gt_right">1059361</td>
      <td class="gt_row gt_right">158.30298</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">North Carolina</td>
      <td class="gt_row gt_right">12223</td>
      <td class="gt_row gt_right">10488084</td>
      <td class="gt_row gt_right">116.54178</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Maine</td>
      <td class="gt_row gt_right">1672</td>
      <td class="gt_row gt_right">1344212</td>
      <td class="gt_row gt_right">124.38514</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Massachusetts</td>
      <td class="gt_row gt_right">11468</td>
      <td class="gt_row gt_right">6949503</td>
      <td class="gt_row gt_right">165.01899</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Montana</td>
      <td class="gt_row gt_right">1365</td>
      <td class="gt_row gt_right">1068778</td>
      <td class="gt_row gt_right">127.71595</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Iowa</td>
      <td class="gt_row gt_right">9367</td>
      <td class="gt_row gt_right">3155070</td>
      <td class="gt_row gt_right">296.88723</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Wyoming</td>
      <td class="gt_row gt_right">913</td>
      <td class="gt_row gt_right">578759</td>
      <td class="gt_row gt_right">157.75133</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Tennessee</td>
      <td class="gt_row gt_right">8527</td>
      <td class="gt_row gt_right">6833174</td>
      <td class="gt_row gt_right">124.78828</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Vermont</td>
      <td class="gt_row gt_right">856</td>
      <td class="gt_row gt_right">623989</td>
      <td class="gt_row gt_right">137.18191</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Wisconsin</td>
      <td class="gt_row gt_right">8308</td>
      <td class="gt_row gt_right">5822434</td>
      <td class="gt_row gt_right">142.68947</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">South Dakota</td>
      <td class="gt_row gt_right">777</td>
      <td class="gt_row gt_right">884659</td>
      <td class="gt_row gt_right">87.83045</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Missouri</td>
      <td class="gt_row gt_right">8160</td>
      <td class="gt_row gt_right">6137428</td>
      <td class="gt_row gt_right">132.95472</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">North Dakota</td>
      <td class="gt_row gt_right">760</td>
      <td class="gt_row gt_right">762062</td>
      <td class="gt_row gt_right">99.72942</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Minnesota</td>
      <td class="gt_row gt_right">6847</td>
      <td class="gt_row gt_right">5639632</td>
      <td class="gt_row gt_right">121.40863</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">U.S. Minor Outlying Islands</td>
      <td class="gt_row gt_right">116</td>
      <td class="gt_row gt_right">360</td>
      <td class="gt_row gt_right">32222.22222</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Oregon</td>
      <td class="gt_row gt_right">6817</td>
      <td class="gt_row gt_right">4217737</td>
      <td class="gt_row gt_right">161.62696</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Guam</td>
      <td class="gt_row gt_right">112</td>
      <td class="gt_row gt_right">165718</td>
      <td class="gt_row gt_right">67.58469</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Kentucky</td>
      <td class="gt_row gt_right">6815</td>
      <td class="gt_row gt_right">4467673</td>
      <td class="gt_row gt_right">152.54026</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">U.S. Virgin Islands</td>
      <td class="gt_row gt_right">92</td>
      <td class="gt_row gt_right">104914</td>
      <td class="gt_row gt_right">87.69087</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">South Carolina</td>
      <td class="gt_row gt_right">5853</td>
      <td class="gt_row gt_right">5148714</td>
      <td class="gt_row gt_right">113.67887</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">American Samoa</td>
      <td class="gt_row gt_right">42</td>
      <td class="gt_row gt_right">55641</td>
      <td class="gt_row gt_right">75.48391</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Alabama</td>
      <td class="gt_row gt_right">5803</td>
      <td class="gt_row gt_right">4903185</td>
      <td class="gt_row gt_right">118.35164</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Northern Mariana Islands</td>
      <td class="gt_row gt_right">20</td>
      <td class="gt_row gt_right">55194</td>
      <td class="gt_row gt_right">36.23582</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Connecticut</td>
      <td class="gt_row gt_right">5636</td>
      <td class="gt_row gt_right">3565287</td>
      <td class="gt_row gt_right">158.07984</td>
    </tr>
  </tbody>
  
  
</table></div>
```

```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#qmlokdjzgl .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#qmlokdjzgl .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qmlokdjzgl .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#qmlokdjzgl .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#qmlokdjzgl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qmlokdjzgl .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qmlokdjzgl .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#qmlokdjzgl .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#qmlokdjzgl .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#qmlokdjzgl .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#qmlokdjzgl .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#qmlokdjzgl .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#qmlokdjzgl .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#qmlokdjzgl .gt_from_md > :first-child {
  margin-top: 0;
}

#qmlokdjzgl .gt_from_md > :last-child {
  margin-bottom: 0;
}

#qmlokdjzgl .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#qmlokdjzgl .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#qmlokdjzgl .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qmlokdjzgl .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#qmlokdjzgl .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qmlokdjzgl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#qmlokdjzgl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#qmlokdjzgl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qmlokdjzgl .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qmlokdjzgl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#qmlokdjzgl .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qmlokdjzgl .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#qmlokdjzgl .gt_left {
  text-align: left;
}

#qmlokdjzgl .gt_center {
  text-align: center;
}

#qmlokdjzgl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#qmlokdjzgl .gt_font_normal {
  font-weight: normal;
}

#qmlokdjzgl .gt_font_bold {
  font-weight: bold;
}

#qmlokdjzgl .gt_font_italic {
  font-style: italic;
}

#qmlokdjzgl .gt_super {
  font-size: 65%;
}

#qmlokdjzgl .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="qmlokdjzgl" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">state</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">loss</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">population</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">per_cap</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">California</td>
      <td class="gt_row gt_right">621452320</td>
      <td class="gt_row gt_right">39512223</td>
      <td class="gt_row gt_right">1572810.3</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">South Carolina</td>
      <td class="gt_row gt_right">25244978</td>
      <td class="gt_row gt_right">5148714</td>
      <td class="gt_row gt_right">490316.2</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New York</td>
      <td class="gt_row gt_right">415812917</td>
      <td class="gt_row gt_right">19453561</td>
      <td class="gt_row gt_right">2137464.3</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Mexico</td>
      <td class="gt_row gt_right">23903594</td>
      <td class="gt_row gt_right">2096829</td>
      <td class="gt_row gt_right">1139987.8</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Texas</td>
      <td class="gt_row gt_right">313565225</td>
      <td class="gt_row gt_right">28995881</td>
      <td class="gt_row gt_right">1081413.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Iowa</td>
      <td class="gt_row gt_right">21396701</td>
      <td class="gt_row gt_right">3155070</td>
      <td class="gt_row gt_right">678168.8</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Florida</td>
      <td class="gt_row gt_right">295032829</td>
      <td class="gt_row gt_right">21477737</td>
      <td class="gt_row gt_right">1373668.1</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Oklahoma</td>
      <td class="gt_row gt_right">20748692</td>
      <td class="gt_row gt_right">3956971</td>
      <td class="gt_row gt_right">524357.9</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Ohio</td>
      <td class="gt_row gt_right">170171951</td>
      <td class="gt_row gt_right">11689100</td>
      <td class="gt_row gt_right">1455817.4</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Kansas</td>
      <td class="gt_row gt_right">19157289</td>
      <td class="gt_row gt_right">2913314</td>
      <td class="gt_row gt_right">657577.2</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Illinois</td>
      <td class="gt_row gt_right">150496678</td>
      <td class="gt_row gt_right">12671821</td>
      <td class="gt_row gt_right">1187648.4</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">District of Columbia</td>
      <td class="gt_row gt_right">18942722</td>
      <td class="gt_row gt_right">705749</td>
      <td class="gt_row gt_right">2684059.3</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Missouri</td>
      <td class="gt_row gt_right">115913584</td>
      <td class="gt_row gt_right">6137428</td>
      <td class="gt_row gt_right">1888634.5</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Mississippi</td>
      <td class="gt_row gt_right">18111738</td>
      <td class="gt_row gt_right">2976149</td>
      <td class="gt_row gt_right">608562.9</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Pennsylvania</td>
      <td class="gt_row gt_right">108506204</td>
      <td class="gt_row gt_right">12801989</td>
      <td class="gt_row gt_right">847573.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Arkansas</td>
      <td class="gt_row gt_right">17371515</td>
      <td class="gt_row gt_right">3017825</td>
      <td class="gt_row gt_right">575630.3</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Virginia</td>
      <td class="gt_row gt_right">101661604</td>
      <td class="gt_row gt_right">8535519</td>
      <td class="gt_row gt_right">1191041.9</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Hawaii</td>
      <td class="gt_row gt_right">13671531</td>
      <td class="gt_row gt_right">1415872</td>
      <td class="gt_row gt_right">965590.9</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Colorado</td>
      <td class="gt_row gt_right">100663897</td>
      <td class="gt_row gt_right">5758736</td>
      <td class="gt_row gt_right">1748020.7</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Puerto Rico</td>
      <td class="gt_row gt_right">13275104</td>
      <td class="gt_row gt_right">3193694</td>
      <td class="gt_row gt_right">415666.1</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Georgia</td>
      <td class="gt_row gt_right">98762523</td>
      <td class="gt_row gt_right">10617423</td>
      <td class="gt_row gt_right">930193.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Kentucky</td>
      <td class="gt_row gt_right">12590784</td>
      <td class="gt_row gt_right">4467673</td>
      <td class="gt_row gt_right">281819.7</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Jersey</td>
      <td class="gt_row gt_right">98727053</td>
      <td class="gt_row gt_right">8882190</td>
      <td class="gt_row gt_right">1111517.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Nebraska</td>
      <td class="gt_row gt_right">11799640</td>
      <td class="gt_row gt_right">1934408</td>
      <td class="gt_row gt_right">609987.1</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Massachusetts</td>
      <td class="gt_row gt_right">97583753</td>
      <td class="gt_row gt_right">6949503</td>
      <td class="gt_row gt_right">1404183.2</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Idaho</td>
      <td class="gt_row gt_right">11670650</td>
      <td class="gt_row gt_right">1787065</td>
      <td class="gt_row gt_right">653062.4</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Washington</td>
      <td class="gt_row gt_right">88020254</td>
      <td class="gt_row gt_right">7614893</td>
      <td class="gt_row gt_right">1155896.1</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">American Samoa</td>
      <td class="gt_row gt_right">7806373</td>
      <td class="gt_row gt_right">55641</td>
      <td class="gt_row gt_right">14029893.4</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Michigan</td>
      <td class="gt_row gt_right">83999442</td>
      <td class="gt_row gt_right">9986857</td>
      <td class="gt_row gt_right">841099.9</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Rhode Island</td>
      <td class="gt_row gt_right">7669670</td>
      <td class="gt_row gt_right">1059361</td>
      <td class="gt_row gt_right">723990.2</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Arizona</td>
      <td class="gt_row gt_right">72128637</td>
      <td class="gt_row gt_right">7278717</td>
      <td class="gt_row gt_right">990952.6</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Alaska</td>
      <td class="gt_row gt_right">7342743</td>
      <td class="gt_row gt_right">731545</td>
      <td class="gt_row gt_right">1003730.9</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">North Carolina</td>
      <td class="gt_row gt_right">69409152</td>
      <td class="gt_row gt_right">10488084</td>
      <td class="gt_row gt_right">661790.6</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Maine</td>
      <td class="gt_row gt_right">7073260</td>
      <td class="gt_row gt_right">1344212</td>
      <td class="gt_row gt_right">526201.2</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Maryland</td>
      <td class="gt_row gt_right">62473193</td>
      <td class="gt_row gt_right">6045680</td>
      <td class="gt_row gt_right">1033352.6</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Delaware</td>
      <td class="gt_row gt_right">6486617</td>
      <td class="gt_row gt_right">973764</td>
      <td class="gt_row gt_right">666138.5</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Minnesota</td>
      <td class="gt_row gt_right">58341798</td>
      <td class="gt_row gt_right">5639632</td>
      <td class="gt_row gt_right">1034496.5</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Montana</td>
      <td class="gt_row gt_right">5669293</td>
      <td class="gt_row gt_right">1068778</td>
      <td class="gt_row gt_right">530446.3</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Utah</td>
      <td class="gt_row gt_right">47113946</td>
      <td class="gt_row gt_right">3205958</td>
      <td class="gt_row gt_right">1469574.6</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Wyoming</td>
      <td class="gt_row gt_right">5096704</td>
      <td class="gt_row gt_right">578759</td>
      <td class="gt_row gt_right">880626.3</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Nevada</td>
      <td class="gt_row gt_right">44383452</td>
      <td class="gt_row gt_right">3080156</td>
      <td class="gt_row gt_right">1440948.2</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Hampshire</td>
      <td class="gt_row gt_right">4949296</td>
      <td class="gt_row gt_right">1359711</td>
      <td class="gt_row gt_right">363996.2</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Connecticut</td>
      <td class="gt_row gt_right">41311798</td>
      <td class="gt_row gt_right">3565287</td>
      <td class="gt_row gt_right">1158722.9</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">West Virginia</td>
      <td class="gt_row gt_right">4823786</td>
      <td class="gt_row gt_right">1792147</td>
      <td class="gt_row gt_right">269162.4</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Tennessee</td>
      <td class="gt_row gt_right">40191616</td>
      <td class="gt_row gt_right">6833174</td>
      <td class="gt_row gt_right">588183.7</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Vermont</td>
      <td class="gt_row gt_right">4175799</td>
      <td class="gt_row gt_right">623989</td>
      <td class="gt_row gt_right">669210.4</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Oregon</td>
      <td class="gt_row gt_right">38389702</td>
      <td class="gt_row gt_right">4217737</td>
      <td class="gt_row gt_right">910196.7</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">South Dakota</td>
      <td class="gt_row gt_right">3208241</td>
      <td class="gt_row gt_right">884659</td>
      <td class="gt_row gt_right">362652.8</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Wisconsin</td>
      <td class="gt_row gt_right">36081681</td>
      <td class="gt_row gt_right">5822434</td>
      <td class="gt_row gt_right">619701.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">U.S. Virgin Islands</td>
      <td class="gt_row gt_right">620962</td>
      <td class="gt_row gt_right">104914</td>
      <td class="gt_row gt_right">591877.2</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Indiana</td>
      <td class="gt_row gt_right">35180105</td>
      <td class="gt_row gt_right">6732219</td>
      <td class="gt_row gt_right">522563.3</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Guam</td>
      <td class="gt_row gt_right">259338</td>
      <td class="gt_row gt_right">165718</td>
      <td class="gt_row gt_right">156493.6</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Alabama</td>
      <td class="gt_row gt_right">27549157</td>
      <td class="gt_row gt_right">4903185</td>
      <td class="gt_row gt_right">561862.5</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">U.S. Minor Outlying Islands</td>
      <td class="gt_row gt_right">201022</td>
      <td class="gt_row gt_right">360</td>
      <td class="gt_row gt_right">55839444.4</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Louisiana</td>
      <td class="gt_row gt_right">26717928</td>
      <td class="gt_row gt_right">4648794</td>
      <td class="gt_row gt_right">574728.2</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Northern Mariana Islands</td>
      <td class="gt_row gt_right">67403</td>
      <td class="gt_row gt_right">55194</td>
      <td class="gt_row gt_right">122120.2</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">North Dakota</td>
      <td class="gt_row gt_right">25804940</td>
      <td class="gt_row gt_right">762062</td>
      <td class="gt_row gt_right">3386199.5</td>
    </tr>
  </tbody>
  
  
</table></div>
```

### page 25 — count by subject per state


```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#kiojxlulbh .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#kiojxlulbh .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kiojxlulbh .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#kiojxlulbh .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#kiojxlulbh .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kiojxlulbh .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kiojxlulbh .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#kiojxlulbh .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#kiojxlulbh .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#kiojxlulbh .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#kiojxlulbh .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#kiojxlulbh .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#kiojxlulbh .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#kiojxlulbh .gt_from_md > :first-child {
  margin-top: 0;
}

#kiojxlulbh .gt_from_md > :last-child {
  margin-bottom: 0;
}

#kiojxlulbh .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#kiojxlulbh .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#kiojxlulbh .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kiojxlulbh .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#kiojxlulbh .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kiojxlulbh .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#kiojxlulbh .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#kiojxlulbh .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kiojxlulbh .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kiojxlulbh .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#kiojxlulbh .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kiojxlulbh .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#kiojxlulbh .gt_left {
  text-align: left;
}

#kiojxlulbh .gt_center {
  text-align: center;
}

#kiojxlulbh .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#kiojxlulbh .gt_font_normal {
  font-weight: normal;
}

#kiojxlulbh .gt_font_bold {
  font-weight: bold;
}

#kiojxlulbh .gt_font_italic {
  font-style: italic;
}

#kiojxlulbh .gt_super {
  font-size: 65%;
}

#kiojxlulbh .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="kiojxlulbh" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">state</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">subjects</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">population</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">per_cap</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">California</td>
      <td class="gt_row gt_right">26379</td>
      <td class="gt_row gt_right">39512223</td>
      <td class="gt_row gt_right">66.761620</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Utah</td>
      <td class="gt_row gt_right">1251</td>
      <td class="gt_row gt_right">3205958</td>
      <td class="gt_row gt_right">39.021098</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Florida</td>
      <td class="gt_row gt_right">19364</td>
      <td class="gt_row gt_right">21477737</td>
      <td class="gt_row gt_right">90.158474</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Louisiana</td>
      <td class="gt_row gt_right">1246</td>
      <td class="gt_row gt_right">4648794</td>
      <td class="gt_row gt_right">26.802650</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Texas</td>
      <td class="gt_row gt_right">12914</td>
      <td class="gt_row gt_right">28995881</td>
      <td class="gt_row gt_right">44.537360</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">District of Columbia</td>
      <td class="gt_row gt_right">1174</td>
      <td class="gt_row gt_right">705749</td>
      <td class="gt_row gt_right">166.348093</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Jersey</td>
      <td class="gt_row gt_right">10616</td>
      <td class="gt_row gt_right">8882190</td>
      <td class="gt_row gt_right">119.520073</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Kentucky</td>
      <td class="gt_row gt_right">1146</td>
      <td class="gt_row gt_right">4467673</td>
      <td class="gt_row gt_right">25.650937</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New York</td>
      <td class="gt_row gt_right">10052</td>
      <td class="gt_row gt_right">19453561</td>
      <td class="gt_row gt_right">51.671774</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Delaware</td>
      <td class="gt_row gt_right">1096</td>
      <td class="gt_row gt_right">973764</td>
      <td class="gt_row gt_right">112.552939</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Maryland</td>
      <td class="gt_row gt_right">7279</td>
      <td class="gt_row gt_right">6045680</td>
      <td class="gt_row gt_right">120.400021</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Kansas</td>
      <td class="gt_row gt_right">1090</td>
      <td class="gt_row gt_right">2913314</td>
      <td class="gt_row gt_right">37.414436</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Illinois</td>
      <td class="gt_row gt_right">4780</td>
      <td class="gt_row gt_right">12671821</td>
      <td class="gt_row gt_right">37.721492</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Connecticut</td>
      <td class="gt_row gt_right">969</td>
      <td class="gt_row gt_right">3565287</td>
      <td class="gt_row gt_right">27.178738</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Georgia</td>
      <td class="gt_row gt_right">4321</td>
      <td class="gt_row gt_right">10617423</td>
      <td class="gt_row gt_right">40.697258</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Mexico</td>
      <td class="gt_row gt_right">890</td>
      <td class="gt_row gt_right">2096829</td>
      <td class="gt_row gt_right">42.445044</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Pennsylvania</td>
      <td class="gt_row gt_right">4066</td>
      <td class="gt_row gt_right">12801989</td>
      <td class="gt_row gt_right">31.760690</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Mississippi</td>
      <td class="gt_row gt_right">824</td>
      <td class="gt_row gt_right">2976149</td>
      <td class="gt_row gt_right">27.686786</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Virginia</td>
      <td class="gt_row gt_right">3929</td>
      <td class="gt_row gt_right">8535519</td>
      <td class="gt_row gt_right">46.031179</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Arkansas</td>
      <td class="gt_row gt_right">784</td>
      <td class="gt_row gt_right">3017825</td>
      <td class="gt_row gt_right">25.978975</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Washington</td>
      <td class="gt_row gt_right">3807</td>
      <td class="gt_row gt_right">7614893</td>
      <td class="gt_row gt_right">49.994136</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Iowa</td>
      <td class="gt_row gt_right">721</td>
      <td class="gt_row gt_right">3155070</td>
      <td class="gt_row gt_right">22.852108</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Ohio</td>
      <td class="gt_row gt_right">3708</td>
      <td class="gt_row gt_right">11689100</td>
      <td class="gt_row gt_right">31.721861</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Maine</td>
      <td class="gt_row gt_right">691</td>
      <td class="gt_row gt_right">1344212</td>
      <td class="gt_row gt_right">51.405582</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Nevada</td>
      <td class="gt_row gt_right">3707</td>
      <td class="gt_row gt_right">3080156</td>
      <td class="gt_row gt_right">120.351047</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Hawaii</td>
      <td class="gt_row gt_right">490</td>
      <td class="gt_row gt_right">1415872</td>
      <td class="gt_row gt_right">34.607648</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Arizona</td>
      <td class="gt_row gt_right">3005</td>
      <td class="gt_row gt_right">7278717</td>
      <td class="gt_row gt_right">41.284748</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">West Virginia</td>
      <td class="gt_row gt_right">449</td>
      <td class="gt_row gt_right">1792147</td>
      <td class="gt_row gt_right">25.053748</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">North Carolina</td>
      <td class="gt_row gt_right">2940</td>
      <td class="gt_row gt_right">10488084</td>
      <td class="gt_row gt_right">28.031812</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Idaho</td>
      <td class="gt_row gt_right">448</td>
      <td class="gt_row gt_right">1787065</td>
      <td class="gt_row gt_right">25.069038</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Michigan</td>
      <td class="gt_row gt_right">2793</td>
      <td class="gt_row gt_right">9986857</td>
      <td class="gt_row gt_right">27.966757</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">North Dakota</td>
      <td class="gt_row gt_right">425</td>
      <td class="gt_row gt_right">762062</td>
      <td class="gt_row gt_right">55.769741</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Colorado</td>
      <td class="gt_row gt_right">2502</td>
      <td class="gt_row gt_right">5758736</td>
      <td class="gt_row gt_right">43.447034</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Hampshire</td>
      <td class="gt_row gt_right">360</td>
      <td class="gt_row gt_right">1359711</td>
      <td class="gt_row gt_right">26.476214</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Tennessee</td>
      <td class="gt_row gt_right">2480</td>
      <td class="gt_row gt_right">6833174</td>
      <td class="gt_row gt_right">36.293529</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Puerto Rico</td>
      <td class="gt_row gt_right">330</td>
      <td class="gt_row gt_right">3193694</td>
      <td class="gt_row gt_right">10.332862</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Indiana</td>
      <td class="gt_row gt_right">2211</td>
      <td class="gt_row gt_right">6732219</td>
      <td class="gt_row gt_right">32.842069</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Rhode Island</td>
      <td class="gt_row gt_right">330</td>
      <td class="gt_row gt_right">1059361</td>
      <td class="gt_row gt_right">31.150854</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Massachusetts</td>
      <td class="gt_row gt_right">2192</td>
      <td class="gt_row gt_right">6949503</td>
      <td class="gt_row gt_right">31.541824</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Alaska</td>
      <td class="gt_row gt_right">292</td>
      <td class="gt_row gt_right">731545</td>
      <td class="gt_row gt_right">39.915521</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Missouri</td>
      <td class="gt_row gt_right">1824</td>
      <td class="gt_row gt_right">6137428</td>
      <td class="gt_row gt_right">29.719290</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Wyoming</td>
      <td class="gt_row gt_right">277</td>
      <td class="gt_row gt_right">578759</td>
      <td class="gt_row gt_right">47.861027</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Nebraska</td>
      <td class="gt_row gt_right">1734</td>
      <td class="gt_row gt_right">1934408</td>
      <td class="gt_row gt_right">89.639828</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">South Dakota</td>
      <td class="gt_row gt_right">213</td>
      <td class="gt_row gt_right">884659</td>
      <td class="gt_row gt_right">24.077074</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Oklahoma</td>
      <td class="gt_row gt_right">1721</td>
      <td class="gt_row gt_right">3956971</td>
      <td class="gt_row gt_right">43.492864</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Vermont</td>
      <td class="gt_row gt_right">172</td>
      <td class="gt_row gt_right">623989</td>
      <td class="gt_row gt_right">27.564588</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Minnesota</td>
      <td class="gt_row gt_right">1699</td>
      <td class="gt_row gt_right">5639632</td>
      <td class="gt_row gt_right">30.126079</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">U.S. Minor Outlying Islands</td>
      <td class="gt_row gt_right">32</td>
      <td class="gt_row gt_right">360</td>
      <td class="gt_row gt_right">8888.888889</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Alabama</td>
      <td class="gt_row gt_right">1574</td>
      <td class="gt_row gt_right">4903185</td>
      <td class="gt_row gt_right">32.101583</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Guam</td>
      <td class="gt_row gt_right">22</td>
      <td class="gt_row gt_right">165718</td>
      <td class="gt_row gt_right">13.275565</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Oregon</td>
      <td class="gt_row gt_right">1543</td>
      <td class="gt_row gt_right">4217737</td>
      <td class="gt_row gt_right">36.583599</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">U.S. Virgin Islands</td>
      <td class="gt_row gt_right">18</td>
      <td class="gt_row gt_right">104914</td>
      <td class="gt_row gt_right">17.156909</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Montana</td>
      <td class="gt_row gt_right">1507</td>
      <td class="gt_row gt_right">1068778</td>
      <td class="gt_row gt_right">141.002154</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">American Samoa</td>
      <td class="gt_row gt_right">6</td>
      <td class="gt_row gt_right">55641</td>
      <td class="gt_row gt_right">10.783415</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Wisconsin</td>
      <td class="gt_row gt_right">1342</td>
      <td class="gt_row gt_right">5822434</td>
      <td class="gt_row gt_right">23.048780</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Northern Mariana Islands</td>
      <td class="gt_row gt_right">2</td>
      <td class="gt_row gt_right">55194</td>
      <td class="gt_row gt_right">3.623582</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">South Carolina</td>
      <td class="gt_row gt_right">1341</td>
      <td class="gt_row gt_right">5148714</td>
      <td class="gt_row gt_right">26.045339</td>
    </tr>
  </tbody>
  
  
</table></div>
```

### page 26 — subject earnings per destination state


```{=html}
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#pbrtdbofie .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pbrtdbofie .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pbrtdbofie .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pbrtdbofie .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pbrtdbofie .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pbrtdbofie .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pbrtdbofie .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pbrtdbofie .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pbrtdbofie .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pbrtdbofie .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pbrtdbofie .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pbrtdbofie .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#pbrtdbofie .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pbrtdbofie .gt_from_md > :first-child {
  margin-top: 0;
}

#pbrtdbofie .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pbrtdbofie .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pbrtdbofie .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#pbrtdbofie .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pbrtdbofie .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#pbrtdbofie .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pbrtdbofie .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pbrtdbofie .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pbrtdbofie .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pbrtdbofie .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pbrtdbofie .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#pbrtdbofie .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pbrtdbofie .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#pbrtdbofie .gt_left {
  text-align: left;
}

#pbrtdbofie .gt_center {
  text-align: center;
}

#pbrtdbofie .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pbrtdbofie .gt_font_normal {
  font-weight: normal;
}

#pbrtdbofie .gt_font_bold {
  font-weight: bold;
}

#pbrtdbofie .gt_font_italic {
  font-style: italic;
}

#pbrtdbofie .gt_super {
  font-size: 65%;
}

#pbrtdbofie .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="pbrtdbofie" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">state</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">loss</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">population</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">per_cap</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">California</td>
      <td class="gt_row gt_right">233907224</td>
      <td class="gt_row gt_right">39512223</td>
      <td class="gt_row gt_right">5.919870e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Oregon</td>
      <td class="gt_row gt_right">9473549</td>
      <td class="gt_row gt_right">4217737</td>
      <td class="gt_row gt_right">2.246121e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New York</td>
      <td class="gt_row gt_right">142689230</td>
      <td class="gt_row gt_right">19453561</td>
      <td class="gt_row gt_right">7.334864e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Missouri</td>
      <td class="gt_row gt_right">9322612</td>
      <td class="gt_row gt_right">6137428</td>
      <td class="gt_row gt_right">1.518977e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Texas</td>
      <td class="gt_row gt_right">135573752</td>
      <td class="gt_row gt_right">28995881</td>
      <td class="gt_row gt_right">4.675621e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Utah</td>
      <td class="gt_row gt_right">9225351</td>
      <td class="gt_row gt_right">3205958</td>
      <td class="gt_row gt_right">2.877565e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Florida</td>
      <td class="gt_row gt_right">125049181</td>
      <td class="gt_row gt_right">21477737</td>
      <td class="gt_row gt_right">5.822270e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Kansas</td>
      <td class="gt_row gt_right">9205096</td>
      <td class="gt_row gt_right">2913314</td>
      <td class="gt_row gt_right">3.159665e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Ohio</td>
      <td class="gt_row gt_right">83544428</td>
      <td class="gt_row gt_right">11689100</td>
      <td class="gt_row gt_right">7.147208e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Wisconsin</td>
      <td class="gt_row gt_right">8357864</td>
      <td class="gt_row gt_right">5822434</td>
      <td class="gt_row gt_right">1.435459e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Georgia</td>
      <td class="gt_row gt_right">63933271</td>
      <td class="gt_row gt_right">10617423</td>
      <td class="gt_row gt_right">6.021543e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Kentucky</td>
      <td class="gt_row gt_right">6623738</td>
      <td class="gt_row gt_right">4467673</td>
      <td class="gt_row gt_right">1.482592e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Illinois</td>
      <td class="gt_row gt_right">52691430</td>
      <td class="gt_row gt_right">12671821</td>
      <td class="gt_row gt_right">4.158158e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Iowa</td>
      <td class="gt_row gt_right">6253965</td>
      <td class="gt_row gt_right">3155070</td>
      <td class="gt_row gt_right">1.982195e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Washington</td>
      <td class="gt_row gt_right">47175498</td>
      <td class="gt_row gt_right">7614893</td>
      <td class="gt_row gt_right">6.195162e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Maine</td>
      <td class="gt_row gt_right">6138289</td>
      <td class="gt_row gt_right">1344212</td>
      <td class="gt_row gt_right">4.566459e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Colorado</td>
      <td class="gt_row gt_right">42901870</td>
      <td class="gt_row gt_right">5758736</td>
      <td class="gt_row gt_right">7.449876e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Alaska</td>
      <td class="gt_row gt_right">5785807</td>
      <td class="gt_row gt_right">731545</td>
      <td class="gt_row gt_right">7.909024e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Jersey</td>
      <td class="gt_row gt_right">38491372</td>
      <td class="gt_row gt_right">8882190</td>
      <td class="gt_row gt_right">4.333545e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Mexico</td>
      <td class="gt_row gt_right">5711844</td>
      <td class="gt_row gt_right">2096829</td>
      <td class="gt_row gt_right">2.724039e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Maryland</td>
      <td class="gt_row gt_right">29971760</td>
      <td class="gt_row gt_right">6045680</td>
      <td class="gt_row gt_right">4.957550e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Delaware</td>
      <td class="gt_row gt_right">5673719</td>
      <td class="gt_row gt_right">973764</td>
      <td class="gt_row gt_right">5.826585e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Nevada</td>
      <td class="gt_row gt_right">29127283</td>
      <td class="gt_row gt_right">3080156</td>
      <td class="gt_row gt_right">9.456431e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Nebraska</td>
      <td class="gt_row gt_right">5651920</td>
      <td class="gt_row gt_right">1934408</td>
      <td class="gt_row gt_right">2.921783e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Arizona</td>
      <td class="gt_row gt_right">28473605</td>
      <td class="gt_row gt_right">7278717</td>
      <td class="gt_row gt_right">3.911899e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Mississippi</td>
      <td class="gt_row gt_right">3978526</td>
      <td class="gt_row gt_right">2976149</td>
      <td class="gt_row gt_right">1.336803e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Pennsylvania</td>
      <td class="gt_row gt_right">28431645</td>
      <td class="gt_row gt_right">12801989</td>
      <td class="gt_row gt_right">2.220877e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Hampshire</td>
      <td class="gt_row gt_right">3595627</td>
      <td class="gt_row gt_right">1359711</td>
      <td class="gt_row gt_right">2.644405e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Virginia</td>
      <td class="gt_row gt_right">25657584</td>
      <td class="gt_row gt_right">8535519</td>
      <td class="gt_row gt_right">3.005978e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Idaho</td>
      <td class="gt_row gt_right">3582262</td>
      <td class="gt_row gt_right">1787065</td>
      <td class="gt_row gt_right">2.004550e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Michigan</td>
      <td class="gt_row gt_right">24395899</td>
      <td class="gt_row gt_right">9986857</td>
      <td class="gt_row gt_right">2.442800e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Hawaii</td>
      <td class="gt_row gt_right">3168489</td>
      <td class="gt_row gt_right">1415872</td>
      <td class="gt_row gt_right">2.237836e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">North Dakota</td>
      <td class="gt_row gt_right">22018169</td>
      <td class="gt_row gt_right">762062</td>
      <td class="gt_row gt_right">2.889288e+06</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Arkansas</td>
      <td class="gt_row gt_right">2546501</td>
      <td class="gt_row gt_right">3017825</td>
      <td class="gt_row gt_right">8.438200e+04</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">North Carolina</td>
      <td class="gt_row gt_right">20552835</td>
      <td class="gt_row gt_right">10488084</td>
      <td class="gt_row gt_right">1.959637e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">South Dakota</td>
      <td class="gt_row gt_right">2486492</td>
      <td class="gt_row gt_right">884659</td>
      <td class="gt_row gt_right">2.810678e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">District of Columbia</td>
      <td class="gt_row gt_right">14479130</td>
      <td class="gt_row gt_right">705749</td>
      <td class="gt_row gt_right">2.051598e+06</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Wyoming</td>
      <td class="gt_row gt_right">2337866</td>
      <td class="gt_row gt_right">578759</td>
      <td class="gt_row gt_right">4.039446e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Massachusetts</td>
      <td class="gt_row gt_right">14295694</td>
      <td class="gt_row gt_right">6949503</td>
      <td class="gt_row gt_right">2.057081e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Rhode Island</td>
      <td class="gt_row gt_right">2013255</td>
      <td class="gt_row gt_right">1059361</td>
      <td class="gt_row gt_right">1.900443e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Oklahoma</td>
      <td class="gt_row gt_right">13036365</td>
      <td class="gt_row gt_right">3956971</td>
      <td class="gt_row gt_right">3.294531e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Vermont</td>
      <td class="gt_row gt_right">1506113</td>
      <td class="gt_row gt_right">623989</td>
      <td class="gt_row gt_right">2.413685e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Indiana</td>
      <td class="gt_row gt_right">12864230</td>
      <td class="gt_row gt_right">6732219</td>
      <td class="gt_row gt_right">1.910845e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Puerto Rico</td>
      <td class="gt_row gt_right">1422863</td>
      <td class="gt_row gt_right">3193694</td>
      <td class="gt_row gt_right">4.455226e+04</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Connecticut</td>
      <td class="gt_row gt_right">12533843</td>
      <td class="gt_row gt_right">3565287</td>
      <td class="gt_row gt_right">3.515521e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">West Virginia</td>
      <td class="gt_row gt_right">1352504</td>
      <td class="gt_row gt_right">1792147</td>
      <td class="gt_row gt_right">7.546836e+04</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Tennessee</td>
      <td class="gt_row gt_right">12017224</td>
      <td class="gt_row gt_right">6833174</td>
      <td class="gt_row gt_right">1.758659e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">U.S. Virgin Islands</td>
      <td class="gt_row gt_right">248287</td>
      <td class="gt_row gt_right">104914</td>
      <td class="gt_row gt_right">2.366576e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Louisiana</td>
      <td class="gt_row gt_right">11932340</td>
      <td class="gt_row gt_right">4648794</td>
      <td class="gt_row gt_right">2.566760e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">U.S. Minor Outlying Islands</td>
      <td class="gt_row gt_right">225488</td>
      <td class="gt_row gt_right">360</td>
      <td class="gt_row gt_right">6.263556e+07</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Minnesota</td>
      <td class="gt_row gt_right">11920258</td>
      <td class="gt_row gt_right">5639632</td>
      <td class="gt_row gt_right">2.113659e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Guam</td>
      <td class="gt_row gt_right">12520</td>
      <td class="gt_row gt_right">165718</td>
      <td class="gt_row gt_right">7.555003e+03</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Alabama</td>
      <td class="gt_row gt_right">10739652</td>
      <td class="gt_row gt_right">4903185</td>
      <td class="gt_row gt_right">2.190342e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">American Samoa</td>
      <td class="gt_row gt_right">494</td>
      <td class="gt_row gt_right">55641</td>
      <td class="gt_row gt_right">8.878345e+02</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Montana</td>
      <td class="gt_row gt_right">10262099</td>
      <td class="gt_row gt_right">1068778</td>
      <td class="gt_row gt_right">9.601712e+05</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Northern Mariana Islands</td>
      <td class="gt_row gt_right">315</td>
      <td class="gt_row gt_right">55194</td>
      <td class="gt_row gt_right">5.707142e+02</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">South Carolina</td>
      <td class="gt_row gt_right">10063305</td>
      <td class="gt_row gt_right">5148714</td>
      <td class="gt_row gt_right">1.954528e+05</td>
    </tr>
  </tbody>
  
  
</table></div>
```


### Files


```
## .
## ├── 2020-ic3.R
## ├── 2020-ic3.Rmd
## ├── 2020-ic3.html
## ├── 2020-ic3.md
## ├── 2020-ic3.spin.R
## ├── 2020-ic3.spin.Rmd
## ├── csv
## │   ├── pg16-victims-by-age-group.csv
## │   ├── pg17-top-20-victim-countries.csv
## │   ├── pg19-2020-crime-types-by-victim-count.csv
## │   ├── pg20-2020-crime-types-by-victim-loss.csv
## │   ├── pg21-last-3-year-complaint-counts.csv
## │   ├── pg22-last-3-year-complaint-counts-loss.csv
## │   ├── pg23-2020-overall-state-victim-count.csv
## │   ├── pg24-2020-overall-state-losses.csv
## │   ├── pg25-2020-overall-state-subjects.csv
## │   └── pg26-2020-overall-state-earnings-per-subject.csv
## ├── json
## │   ├── pg16-victims-by-age-group.json
## │   ├── pg17-top-20-victim-countries.json
## │   ├── pg19-2020-crime-types-by-victim-count.json
## │   ├── pg20-2020-crime-types-by-victim-loss.json
## │   ├── pg21-last-3-year-complaint-counts.json
## │   ├── pg22-last-3-year-complaint-counts-loss.json
## │   ├── pg23-2020-overall-state-victim-count.json
## │   ├── pg24-2020-overall-state-losses.json
## │   ├── pg25-2020-overall-state-subjects.json
## │   └── pg26-2020-overall-state-earnings-per-subject.json
## ├── parquet
## │   ├── pg16-victims-by-age-group.parquet
## │   ├── pg17-top-20-victim-countries.parquet
## │   ├── pg19-2020-crime-types-by-victim-count.parquet
## │   ├── pg20-2020-crime-types-by-victim-loss.parquet
## │   ├── pg21-last-3-year-complaint-counts.parquet
## │   ├── pg22-last-3-year-complaint-counts-loss.parquet
## │   ├── pg23-2020-overall-state-victim-count.parquet
## │   ├── pg24-2020-overall-state-losses.parquet
## │   ├── pg25-2020-overall-state-subjects.parquet
## │   └── pg26-2020-overall-state-earnings-per-subject.parquet
## ├── rds
## │   ├── pg16-victims-by-age-group.rds
## │   ├── pg17-top-20-victim-countries.rds
## │   ├── pg19-2020-crime-types-by-victim-count.rds
## │   ├── pg20-2020-crime-types-by-victim-loss.rds
## │   ├── pg21-last-3-year-complaint-counts.rds
## │   ├── pg22-last-3-year-complaint-counts-loss.rds
## │   ├── pg23-2020-overall-state-victim-count.rds
## │   ├── pg24-2020-overall-state-losses.rds
## │   ├── pg25-2020-overall-state-subjects.rds
## │   └── pg26-2020-overall-state-earnings-per-subject.rds
## └── src
##     └── 851104.pdf
```

