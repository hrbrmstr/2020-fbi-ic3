2020 FBI IC3 Data Extraction script
================
hrbrmstr
2021-03-19

-   [2020 FBI IC3 Data Extraction
    script](#2020-fbi-ic3-data-extraction-script)
    -   [page 16 — 2020 victims by age
        group](#page-16--2020-victims-by-age-group)
    -   [page 17 — top 20 international victim
        countries](#page-17--top-20-international-victim-countries)
    -   [page 20 — 2020 crime types by victim
        loss](#page-20--2020-crime-types-by-victim-loss)
    -   [page 21 — last 3 year complaint count
        comparison](#page-21--last-3-year-complaint-count-comparison)
    -   [page 22 — last 3 year complaint loss by crime
        type](#page-22--last-3-year-complaint-loss-by-crime-type)
    -   [page 23 — state statistics victim
        counts](#page-23--state-statistics-victim-counts)
    -   [page 25 — count by subject per
        state](#page-25--count-by-subject-per-state)
    -   [page 26 — subject earnings per destination
        state](#page-26--subject-earnings-per-destination-state)
    -   [Files](#files)

# 2020 FBI IC3 Data Extraction script

Extracts tables from the 2020 FBI IC3 report (in `src/`).

Can just “knit” in RStudio

Command line use (requries pandoc&gt;=1.12.3 on `$PATH`):
`Rscript -e 'knitr::spin("2020-ic3.R", FALSE); rmarkdown::render("2020-ic3.Rmd")'`

### page 16 — 2020 victims by age group

| age\_range | total\_count | total\_loss |
|:-----------|-------------:|------------:|
| Under 20   |        23186 |    70980763 |
| 20 - 29    |        70791 |   197402240 |
| 30 - 39    |        88364 |   492176845 |
| 40 - 49    |        91568 |   717161726 |
| 50 - 59    |        85967 |   847948101 |
| Over 60    |       105301 |   966062236 |

### page 17 — top 20 international victim countries

| country        | victim\_count |
|:---------------|--------------:|
| United Kingdom |        216633 |
| South Africa   |          1754 |
| Brazil         |           951 |
| Nigeria        |           443 |
| Canada         |          5399 |
| France         |          1640 |
| Philippines    |           898 |
| Pakistan       |           443 |
| India          |          2930 |
| Germany        |          1578 |
| Italy          |           728 |
| China          |           442 |
| Greece         |          2314 |
| Mexico         |          1164 |
| Spain          |           618 |
| Colombia       |           418 |
| Australia      |          1807 |
| Belgium        |          1023 |
| Netherlands    |           450 |
| Hong Kong      |           407 |

| crime\_type                        | victim\_count |
|:-----------------------------------|--------------:|
| Phishing/Vishing/Smishing/Pharming |        241342 |
| Non-Payment/Non-Delivery           |        108869 |
| Extortion                          |         76741 |
| Breach                             |         45330 |
| Theft                              |         43330 |
| Spoofing                           |         28218 |
| Misrepresentation                  |         24276 |
| Fraud/Romance                      |         23751 |
| Violence                           |         20604 |
| BEC/EAC                            |         19369 |
| Fraud                              |         17614 |
| Employment                         |         16879 |
| Support                            |         15421 |
| Estate/Rental                      |         13638 |
| Fee                                |         13020 |
| Impersonation                      |         12827 |
| Overpayment                        |         10988 |
| Other                              |         10372 |
| Investment                         |          8788 |
| Lottery/Sweepstakes/Inheritance    |          8501 |
| Counterfeit                        |          4213 |
| Children                           |          3202 |
| Breach                             |          2794 |
| Ransomware                         |          2474 |
| Service/TDoS                       |          2018 |
| Malware/Scareware/Virus            |          1423 |
| Related                            |          1383 |
| Matter                             |           968 |
| Re-shipping                        |           883 |
| Charity                            |           659 |
| Gambling                           |           391 |
| Terrorism                          |            65 |
| Hacktivist                         |            52 |

### page 20 — 2020 crime types by victim loss

| crime\_type                        |       loss |
|:-----------------------------------|-----------:|
| BEC/EAC                            | 1866642107 |
| Confidence Fraud/Romance           |  600249821 |
| Investment                         |  336469000 |
| Non-Payment/Non-Delivery           |  265011249 |
| Identity Theft                     |  219484699 |
| Spoofing                           |  216513728 |
| Real Estate/Rental                 |  213196082 |
| Personal Data Breach               |  194473055 |
| Tech Support                       |  146477709 |
| Credit Card Fraud                  |  129820792 |
| Corporate Data Breach              |  128916648 |
| Government Impersonation           |  109938030 |
| Other                              |  101523082 |
| Advanced Fee                       |   83215405 |
| Extortion                          |   70935939 |
| Overpayment                        |   51039922 |
| Ransomware                         |   29157405 |
| Health Care Related                |   29042515 |
| Civil Matter                       |   24915958 |
| Misrepresentation                  |   19707242 |
| Malware/Scareware/Virus            |    6904054 |
| Harassment/Threats Violence        |    6547449 |
| IPR/Copyright/Counterfeit          |    5910617 |
| Charity                            |    4428766 |
| Gambling                           |    3961508 |
| Re-shipping                        |    3095265 |
| Crimes Against Children            |     660044 |
| Denial of Service/TDos             |     512127 |
| Hacktivist                         |         50 |
| Terrorism                          |          0 |
| Employment                         |   62314015 |
| Lottery/Sweepstakes/Inheritance    |   61111319 |
| Phishing/Vishing/Smishing/Pharming |   54241075 |

### page 21 — last 3 year complaint count comparison

| crime\_type                        | year | victim\_count |
|:-----------------------------------|-----:|--------------:|
| BEC/EAC                            | 2020 |         19369 |
| Charity                            | 2020 |           659 |
| Civil Matter                       | 2020 |           968 |
| Confidence Fraud/Romance           | 2020 |         23751 |
| Corporate Data Breach              | 2020 |          2794 |
| Credit Card Fraud                  | 2020 |         17614 |
| Crimes Against Children            | 2020 |          3202 |
| Denial of Service/TDoS             | 2020 |          2018 |
| Employment                         | 2020 |         16879 |
| Extortion                          | 2020 |         76741 |
| Gambling                           | 2020 |           391 |
| Government Impersonation           | 2020 |         12827 |
| Hacktivist                         | 2020 |            52 |
| Harassment/Threats of Violence     | 2020 |         20604 |
| Health Care Related                | 2020 |          1383 |
| Identity Theft                     | 2020 |         43330 |
| Investment                         | 2020 |          8788 |
| IPR/Copyright and Counterfeit      | 2020 |          4213 |
| Lottery/Sweepstakes/Inheritance    | 2020 |          8501 |
| Malware/Scareware/Virus            | 2020 |          1423 |
| Misrepresentation                  | 2020 |         24276 |
| Non-Payment/Non-Delivery           | 2020 |        108869 |
| Other                              | 2020 |         10372 |
| Overpayment                        | 2020 |         10988 |
| Personal Data Breach               | 2020 |         45330 |
| Phishing/Vishing/Smishing/Pharming | 2020 |        241342 |
| Ransomware                         | 2020 |          2474 |
| Real Estate/Rental                 | 2020 |         13638 |
| Re-Shipping                        | 2020 |           883 |
| Spoofing                           | 2020 |         28218 |
| Tech Support                       | 2020 |         15421 |
| Terrorism                          | 2020 |            65 |
| BEC/EAC                            | 2019 |         23775 |
| Charity                            | 2019 |           407 |
| Civil Matter                       | 2019 |           908 |
| Confidence Fraud/Romance           | 2019 |         19473 |
| Corporate Data Breach              | 2019 |          1795 |
| Credit Card Fraud                  | 2019 |         14378 |
| Crimes Against Children            | 2019 |          1312 |
| Denial of Service/TDoS             | 2019 |          1353 |
| Employment                         | 2019 |         14493 |
| Extortion                          | 2019 |         43101 |
| Gambling                           | 2019 |           262 |
| Government Impersonation           | 2019 |         13873 |
| Hacktivist                         | 2019 |            39 |
| Harassment/Threats of Violence     | 2019 |         15502 |
| Health Care Related                | 2019 |           657 |
| Identity Theft                     | 2019 |         16053 |
| Investment                         | 2019 |          3999 |
| IPR/Copyright and Counterfeit      | 2019 |          3892 |
| Lottery/Sweepstakes/Inheritance    | 2019 |          7767 |
| Malware/Scareware/Virus            | 2019 |          2373 |
| Misrepresentation                  | 2019 |          5975 |
| Non-Payment/Non-Delivery           | 2019 |         61832 |
| Other                              | 2019 |         10842 |
| Overpayment                        | 2019 |         15395 |
| Personal Data Breach               | 2019 |         38218 |
| Phishing/Vishing/Smishing/Pharming | 2019 |        114702 |
| Ransomware                         | 2019 |          2047 |
| Real Estate/Rental                 | 2019 |         11677 |
| Re-Shipping                        | 2019 |           929 |
| Spoofing                           | 2019 |         25789 |
| Tech Support                       | 2019 |         13633 |
| Terrorism                          | 2019 |            61 |
| BEC/EAC                            | 2018 |         20373 |
| Charity                            | 2018 |           493 |
| Civil Matter                       | 2018 |           768 |
| Confidence Fraud/Romance           | 2018 |         18493 |
| Corporate Data Breach              | 2018 |          2480 |
| Credit Card Fraud                  | 2018 |         15210 |
| Crimes Against Children            | 2018 |          1394 |
| Denial of Service/TDoS             | 2018 |          1799 |
| Employment                         | 2018 |         14979 |
| Extortion                          | 2018 |         51146 |
| Gambling                           | 2018 |           181 |
| Government Impersonation           | 2018 |         10978 |
| Hacktivist                         | 2018 |            77 |
| Harassment/Threats of Violence     | 2018 |         18415 |
| Health Care Related                | 2018 |           337 |
| Identity Theft                     | 2018 |         16128 |
| Investment                         | 2018 |          3693 |
| IPR/Copyright and Counterfeit      | 2018 |          2249 |
| Lottery/Sweepstakes/Inheritance    | 2018 |          7146 |
| Malware/Scareware/Virus            | 2018 |          2811 |
| Misrepresentation                  | 2018 |          5959 |
| Non-Payment/Non-Delivery           | 2018 |         65116 |
| Other                              | 2018 |         10826 |
| Overpayment                        | 2018 |         15512 |
| Personal Data Breach               | 2018 |         50642 |
| Phishing/Vishing/Smishing/Pharming | 2018 |         26379 |
| Ransomware                         | 2018 |          1493 |
| Real Estate/Rental                 | 2018 |         11300 |
| Re-Shipping                        | 2018 |           907 |
| Spoofing                           | 2018 |         15569 |
| Tech Support                       | 2018 |         14408 |
| Terrorism                          | 2018 |           120 |

### page 22 — last 3 year complaint loss by crime type

| crime\_type                        | year |       loss |
|:-----------------------------------|-----:|-----------:|
| Advanced Fee                       | 2020 |   83215405 |
| BEC/EAC                            | 2020 | 1866642107 |
| Charity                            | 2020 |    4428766 |
| Civil Matter                       | 2020 |   24915958 |
| Confidence Fraud/Romance           | 2020 |  600249821 |
| Corporate Data Breach              | 2020 |  128916648 |
| Credit Card Fraud                  | 2020 |  129820792 |
| Crimes Against Children            | 2020 |     660044 |
| Denial of Service/TDoS             | 2020 |     512127 |
| Employment                         | 2020 |   62314015 |
| Extortion                          | 2020 |   70935939 |
| Gambling                           | 2020 |    3961508 |
| Government Impersonation           | 2020 |  109938030 |
| Hacktivist                         | 2020 |         50 |
| Harassment/Threats of Violence     | 2020 |    6547449 |
| Health Care Related                | 2020 |   29042515 |
| Identity Theft                     | 2020 |  219484699 |
| Investment                         | 2020 |  336469000 |
| IPR/Copyright and Counterfeit      | 2020 |    5910617 |
| Lottery/Sweepstakes/Inheritance    | 2020 |   61111319 |
| Malware/Scareware/Virus            | 2020 |    6904054 |
| Misrepresentation                  | 2020 |   19707242 |
| Non-Payment/Non-Delivery           | 2020 |  265011249 |
| Other                              | 2020 |  101523082 |
| Overpayment                        | 2020 |   51039922 |
| Personal Data Breach               | 2020 |  194473055 |
| Phishing/Vishing/Smishing/Pharming | 2020 |   54241075 |
| Ransomware                         | 2020 |   29157405 |
| Real Estate/Rental                 | 2020 |  213196082 |
| Re-Shipping                        | 2020 |    3095265 |
| Spoofing                           | 2020 |  216513728 |
| Tech Support                       | 2020 |  146477709 |
| Terrorism                          | 2020 |          0 |
| Advanced Fee                       | 2019 |  100602297 |
| BEC/EAC                            | 2019 | 1776549688 |
| Charity                            | 2019 |    2214383 |
| Civil Matter                       | 2019 |   20242867 |
| Confidence Fraud/Romance           | 2019 |  475014032 |
| Corporate Data Breach              | 2019 |   53398278 |
| Credit Card Fraud                  | 2019 |  111491163 |
| Crimes Against Children            | 2019 |     975311 |
| Denial of Service/TDoS             | 2019 |    7598198 |
| Employment                         | 2019 |   42618705 |
| Extortion                          | 2019 |  107498956 |
| Gambling                           | 2019 |    1458118 |
| Government Impersonation           | 2019 |  124292606 |
| Hacktivist                         | 2019 |     129000 |
| Harassment/Threats of Violence     | 2019 |   19866654 |
| Health Care Related                | 2019 |    1128838 |
| Identity Theft                     | 2019 |  160305789 |
| Investment                         | 2019 |  222186195 |
| IPR/Copyright and Counterfeit      | 2019 |   10293307 |
| Lottery/Sweepstakes/Inheritance    | 2019 |   48642332 |
| Malware/Scareware/Virus            | 2019 |    2009119 |
| Misrepresentation                  | 2019 |   12371573 |
| Non-Payment/Non-Delivery           | 2019 |  196563497 |
| Other                              | 2019 |   66223160 |
| Overpayment                        | 2019 |   55820212 |
| Personal Data Breach               | 2019 |  120102501 |
| Phishing/Vishing/Smishing/Pharming | 2019 |   57836379 |
| Ransomware                         | 2019 |    8965847 |
| Real Estate/Rental                 | 2019 |  221365911 |
| Re-Shipping                        | 2019 |    1772692 |
| Spoofing                           | 2019 |  300478433 |
| Tech Support                       | 2019 |   54041053 |
| Terrorism                          | 2019 |      49589 |
| Advanced Fee                       | 2018 |   92271682 |
| BEC/EAC                            | 2018 | 1297803489 |
| Charity                            | 2018 |    1006379 |
| Civil Matter                       | 2018 |   15172692 |
| Confidence Fraud/Romance           | 2018 |  362500761 |
| Corporate Data Breach              | 2018 |  117711989 |
| Credit Card Fraud                  | 2018 |   88991436 |
| Crimes Against Children            | 2018 |     265996 |
| Denial of Service/TDoS             | 2018 |    2052340 |
| Employment                         | 2018 |   45487120 |
| Extortion                          | 2018 |   83357901 |
| Gambling                           | 2018 |     926953 |
| Government Impersonation           | 2018 |   64211765 |
| Hacktivist                         | 2018 |      77612 |
| Harassment/Threats of Violence     | 2018 |   21903829 |
| Health Care Related                | 2018 |    4474792 |
| Identity Theft                     | 2018 |  100429691 |
| Investment                         | 2018 |  252955320 |
| IPR/Copyright and Counterfeit      | 2018 |   15802011 |
| Lottery/Sweepstakes/Inheritance    | 2018 |   60214814 |
| Malware/Scareware/Virus            | 2018 |    7411651 |
| Misrepresentation                  | 2018 |   20000713 |
| Non-Payment/Non-Delivery           | 2018 |  183826809 |
| Other                              | 2018 |   63126929 |
| Overpayment                        | 2018 |   53225507 |
| Personal Data Breach               | 2018 |  148892403 |
| Phishing/Vishing/Smishing/Pharming | 2018 |   48241748 |
| Ransomware                         | 2018 |    3621857 |
| Real Estate/Rental                 | 2018 |  149458114 |
| Re-Shipping                        | 2018 |    1684179 |
| Spoofing                           | 2018 |   70000248 |
| Tech Support                       | 2018 |   38697026 |
| Terrorism                          | 2018 |      10193 |

### page 23 — state statistics victim counts

| state                       | victim\_count | population |    per\_cap |
|:----------------------------|--------------:|-----------:|------------:|
| California                  |         69541 |   39512223 |   175.99870 |
| Louisiana                   |          5077 |    4648794 |   109.21112 |
| Florida                     |         53793 |   21477737 |   250.45935 |
| Utah                        |          4926 |    3205958 |   153.65142 |
| Texas                       |         38640 |   28995881 |   133.26031 |
| Oklahoma                    |          4785 |    3956971 |   120.92583 |
| New York                    |         34505 |   19453561 |   177.37113 |
| Arkansas                    |          4237 |    3017825 |   140.39913 |
| Illinois                    |         20185 |   12671821 |   159.29044 |
| Kansas                      |          3457 |    2913314 |   118.66211 |
| Pennsylvania                |         18636 |   12801989 |   145.57113 |
| New Mexico                  |          3427 |    2096829 |   163.43727 |
| Washington                  |         17229 |    7614893 |   226.25400 |
| Mississippi                 |          2478 |    2976149 |    83.26196 |
| Nevada                      |         16110 |    3080156 |   523.02546 |
| Delaware                    |          2230 |     973764 |   229.00826 |
| New Jersey                  |         14829 |    8882190 |   166.95207 |
| Idaho                       |          2209 |    1787065 |   123.61050 |
| Maryland                    |         14804 |    6045680 |   244.86906 |
| Nebraska                    |          2166 |    1934408 |   111.97224 |
| Virginia                    |         13770 |    8535519 |   161.32587 |
| District of Columbia        |          2132 |     705749 |   302.09040 |
| Ohio                        |         13421 |   11689100 |   114.81637 |
| Alaska                      |          2073 |     731545 |   283.37286 |
| Georgia                     |         13402 |   10617423 |   126.22649 |
| New Hampshire               |          2015 |    1359711 |   148.19326 |
| Arizona                     |         13009 |    7278717 |   178.72655 |
| Hawaii                      |          1978 |    1415872 |   139.70189 |
| Indiana                     |         12786 |    6732219 |   189.92252 |
| West Virginia               |          1902 |    1792147 |   106.12969 |
| Michigan                    |         12521 |    9986857 |   125.37478 |
| Puerto Rico                 |          1886 |    3193694 |    59.05387 |
| Colorado                    |         12325 |    5758736 |   214.02266 |
| Rhode Island                |          1677 |    1059361 |   158.30298 |
| North Carolina              |         12223 |   10488084 |   116.54178 |
| Maine                       |          1672 |    1344212 |   124.38514 |
| Massachusetts               |         11468 |    6949503 |   165.01899 |
| Montana                     |          1365 |    1068778 |   127.71595 |
| Iowa                        |          9367 |    3155070 |   296.88723 |
| Wyoming                     |           913 |     578759 |   157.75133 |
| Tennessee                   |          8527 |    6833174 |   124.78828 |
| Vermont                     |           856 |     623989 |   137.18191 |
| Wisconsin                   |          8308 |    5822434 |   142.68947 |
| South Dakota                |           777 |     884659 |    87.83045 |
| Missouri                    |          8160 |    6137428 |   132.95472 |
| North Dakota                |           760 |     762062 |    99.72942 |
| Minnesota                   |          6847 |    5639632 |   121.40863 |
| U.S. Minor Outlying Islands |           116 |        360 | 32222.22222 |
| Oregon                      |          6817 |    4217737 |   161.62696 |
| Guam                        |           112 |     165718 |    67.58469 |
| Kentucky                    |          6815 |    4467673 |   152.54026 |
| U.S. Virgin Islands         |            92 |     104914 |    87.69087 |
| South Carolina              |          5853 |    5148714 |   113.67887 |
| American Samoa              |            42 |      55641 |    75.48391 |
| Alabama                     |          5803 |    4903185 |   118.35164 |
| Northern Mariana Islands    |            20 |      55194 |    36.23582 |
| Connecticut                 |          5636 |    3565287 |   158.07984 |

| state                       |      loss | population |   per\_cap |
|:----------------------------|----------:|-----------:|-----------:|
| California                  | 621452320 |   39512223 |  1572810.3 |
| South Carolina              |  25244978 |    5148714 |   490316.2 |
| New York                    | 415812917 |   19453561 |  2137464.3 |
| New Mexico                  |  23903594 |    2096829 |  1139987.8 |
| Texas                       | 313565225 |   28995881 |  1081413.0 |
| Iowa                        |  21396701 |    3155070 |   678168.8 |
| Florida                     | 295032829 |   21477737 |  1373668.1 |
| Oklahoma                    |  20748692 |    3956971 |   524357.9 |
| Ohio                        | 170171951 |   11689100 |  1455817.4 |
| Kansas                      |  19157289 |    2913314 |   657577.2 |
| Illinois                    | 150496678 |   12671821 |  1187648.4 |
| District of Columbia        |  18942722 |     705749 |  2684059.3 |
| Missouri                    | 115913584 |    6137428 |  1888634.5 |
| Mississippi                 |  18111738 |    2976149 |   608562.9 |
| Pennsylvania                | 108506204 |   12801989 |   847573.0 |
| Arkansas                    |  17371515 |    3017825 |   575630.3 |
| Virginia                    | 101661604 |    8535519 |  1191041.9 |
| Hawaii                      |  13671531 |    1415872 |   965590.9 |
| Colorado                    | 100663897 |    5758736 |  1748020.7 |
| Puerto Rico                 |  13275104 |    3193694 |   415666.1 |
| Georgia                     |  98762523 |   10617423 |   930193.0 |
| Kentucky                    |  12590784 |    4467673 |   281819.7 |
| New Jersey                  |  98727053 |    8882190 |  1111517.0 |
| Nebraska                    |  11799640 |    1934408 |   609987.1 |
| Massachusetts               |  97583753 |    6949503 |  1404183.2 |
| Idaho                       |  11670650 |    1787065 |   653062.4 |
| Washington                  |  88020254 |    7614893 |  1155896.1 |
| American Samoa              |   7806373 |      55641 | 14029893.4 |
| Michigan                    |  83999442 |    9986857 |   841099.9 |
| Rhode Island                |   7669670 |    1059361 |   723990.2 |
| Arizona                     |  72128637 |    7278717 |   990952.6 |
| Alaska                      |   7342743 |     731545 |  1003730.9 |
| North Carolina              |  69409152 |   10488084 |   661790.6 |
| Maine                       |   7073260 |    1344212 |   526201.2 |
| Maryland                    |  62473193 |    6045680 |  1033352.6 |
| Delaware                    |   6486617 |     973764 |   666138.5 |
| Minnesota                   |  58341798 |    5639632 |  1034496.5 |
| Montana                     |   5669293 |    1068778 |   530446.3 |
| Utah                        |  47113946 |    3205958 |  1469574.6 |
| Wyoming                     |   5096704 |     578759 |   880626.3 |
| Nevada                      |  44383452 |    3080156 |  1440948.2 |
| New Hampshire               |   4949296 |    1359711 |   363996.2 |
| Connecticut                 |  41311798 |    3565287 |  1158722.9 |
| West Virginia               |   4823786 |    1792147 |   269162.4 |
| Tennessee                   |  40191616 |    6833174 |   588183.7 |
| Vermont                     |   4175799 |     623989 |   669210.4 |
| Oregon                      |  38389702 |    4217737 |   910196.7 |
| South Dakota                |   3208241 |     884659 |   362652.8 |
| Wisconsin                   |  36081681 |    5822434 |   619701.0 |
| U.S. Virgin Islands         |    620962 |     104914 |   591877.2 |
| Indiana                     |  35180105 |    6732219 |   522563.3 |
| Guam                        |    259338 |     165718 |   156493.6 |
| Alabama                     |  27549157 |    4903185 |   561862.5 |
| U.S. Minor Outlying Islands |    201022 |        360 | 55839444.4 |
| Louisiana                   |  26717928 |    4648794 |   574728.2 |
| Northern Mariana Islands    |     67403 |      55194 |   122120.2 |
| North Dakota                |  25804940 |     762062 |  3386199.5 |

### page 25 — count by subject per state

| state                       | subjects | population |    per\_cap |
|:----------------------------|---------:|-----------:|------------:|
| California                  |    26379 |   39512223 |   66.761620 |
| Utah                        |     1251 |    3205958 |   39.021098 |
| Florida                     |    19364 |   21477737 |   90.158474 |
| Louisiana                   |     1246 |    4648794 |   26.802650 |
| Texas                       |    12914 |   28995881 |   44.537360 |
| District of Columbia        |     1174 |     705749 |  166.348093 |
| New Jersey                  |    10616 |    8882190 |  119.520073 |
| Kentucky                    |     1146 |    4467673 |   25.650937 |
| New York                    |    10052 |   19453561 |   51.671774 |
| Delaware                    |     1096 |     973764 |  112.552939 |
| Maryland                    |     7279 |    6045680 |  120.400021 |
| Kansas                      |     1090 |    2913314 |   37.414436 |
| Illinois                    |     4780 |   12671821 |   37.721492 |
| Connecticut                 |      969 |    3565287 |   27.178738 |
| Georgia                     |     4321 |   10617423 |   40.697258 |
| New Mexico                  |      890 |    2096829 |   42.445044 |
| Pennsylvania                |     4066 |   12801989 |   31.760690 |
| Mississippi                 |      824 |    2976149 |   27.686786 |
| Virginia                    |     3929 |    8535519 |   46.031179 |
| Arkansas                    |      784 |    3017825 |   25.978975 |
| Washington                  |     3807 |    7614893 |   49.994137 |
| Iowa                        |      721 |    3155070 |   22.852108 |
| Ohio                        |     3708 |   11689100 |   31.721860 |
| Maine                       |      691 |    1344212 |   51.405582 |
| Nevada                      |     3707 |    3080156 |  120.351047 |
| Hawaii                      |      490 |    1415872 |   34.607648 |
| Arizona                     |     3005 |    7278717 |   41.284748 |
| West Virginia               |      449 |    1792147 |   25.053748 |
| North Carolina              |     2940 |   10488084 |   28.031812 |
| Idaho                       |      448 |    1787065 |   25.069038 |
| Michigan                    |     2793 |    9986857 |   27.966757 |
| North Dakota                |      425 |     762062 |   55.769740 |
| Colorado                    |     2502 |    5758736 |   43.447034 |
| New Hampshire               |      360 |    1359711 |   26.476214 |
| Tennessee                   |     2480 |    6833174 |   36.293529 |
| Puerto Rico                 |      330 |    3193694 |   10.332862 |
| Indiana                     |     2211 |    6732219 |   32.842069 |
| Rhode Island                |      330 |    1059361 |   31.150854 |
| Massachusetts               |     2192 |    6949503 |   31.541824 |
| Alaska                      |      292 |     731545 |   39.915521 |
| Missouri                    |     1824 |    6137428 |   29.719290 |
| Wyoming                     |      277 |     578759 |   47.861027 |
| Nebraska                    |     1734 |    1934408 |   89.639828 |
| South Dakota                |      213 |     884659 |   24.077074 |
| Oklahoma                    |     1721 |    3956971 |   43.492864 |
| Vermont                     |      172 |     623989 |   27.564588 |
| Minnesota                   |     1699 |    5639632 |   30.126079 |
| U.S. Minor Outlying Islands |       32 |        360 | 8888.888889 |
| Alabama                     |     1574 |    4903185 |   32.101583 |
| Guam                        |       22 |     165718 |   13.275564 |
| Oregon                      |     1543 |    4217737 |   36.583599 |
| U.S. Virgin Islands         |       18 |     104914 |   17.156910 |
| Montana                     |     1507 |    1068778 |  141.002154 |
| American Samoa              |        6 |      55641 |   10.783415 |
| Wisconsin                   |     1342 |    5822434 |   23.048780 |
| Northern Mariana Islands    |        2 |      55194 |    3.623582 |
| South Carolina              |     1341 |    5148714 |   26.045339 |

### page 26 — subject earnings per destination state

| state                       |      loss | population |     per\_cap |
|:----------------------------|----------:|-----------:|-------------:|
| California                  | 233907224 |   39512223 | 5.919870e+05 |
| Oregon                      |   9473549 |    4217737 | 2.246121e+05 |
| New York                    | 142689230 |   19453561 | 7.334864e+05 |
| Missouri                    |   9322612 |    6137428 | 1.518977e+05 |
| Texas                       | 135573752 |   28995881 | 4.675621e+05 |
| Utah                        |   9225351 |    3205958 | 2.877565e+05 |
| Florida                     | 125049181 |   21477737 | 5.822270e+05 |
| Kansas                      |   9205096 |    2913314 | 3.159665e+05 |
| Ohio                        |  83544428 |   11689100 | 7.147208e+05 |
| Wisconsin                   |   8357864 |    5822434 | 1.435459e+05 |
| Georgia                     |  63933271 |   10617423 | 6.021543e+05 |
| Kentucky                    |   6623738 |    4467673 | 1.482592e+05 |
| Illinois                    |  52691430 |   12671821 | 4.158158e+05 |
| Iowa                        |   6253965 |    3155070 | 1.982195e+05 |
| Washington                  |  47175498 |    7614893 | 6.195162e+05 |
| Maine                       |   6138289 |    1344212 | 4.566459e+05 |
| Colorado                    |  42901870 |    5758736 | 7.449876e+05 |
| Alaska                      |   5785807 |     731545 | 7.909024e+05 |
| New Jersey                  |  38491372 |    8882190 | 4.333545e+05 |
| New Mexico                  |   5711844 |    2096829 | 2.724039e+05 |
| Maryland                    |  29971760 |    6045680 | 4.957550e+05 |
| Delaware                    |   5673719 |     973764 | 5.826585e+05 |
| Nevada                      |  29127283 |    3080156 | 9.456431e+05 |
| Nebraska                    |   5651920 |    1934408 | 2.921783e+05 |
| Arizona                     |  28473605 |    7278717 | 3.911899e+05 |
| Mississippi                 |   3978526 |    2976149 | 1.336803e+05 |
| Pennsylvania                |  28431645 |   12801989 | 2.220877e+05 |
| New Hampshire               |   3595627 |    1359711 | 2.644405e+05 |
| Virginia                    |  25657584 |    8535519 | 3.005978e+05 |
| Idaho                       |   3582262 |    1787065 | 2.004550e+05 |
| Michigan                    |  24395899 |    9986857 | 2.442800e+05 |
| Hawaii                      |   3168489 |    1415872 | 2.237836e+05 |
| North Dakota                |  22018169 |     762062 | 2.889288e+06 |
| Arkansas                    |   2546501 |    3017825 | 8.438200e+04 |
| North Carolina              |  20552835 |   10488084 | 1.959637e+05 |
| South Dakota                |   2486492 |     884659 | 2.810678e+05 |
| District of Columbia        |  14479130 |     705749 | 2.051598e+06 |
| Wyoming                     |   2337866 |     578759 | 4.039446e+05 |
| Massachusetts               |  14295694 |    6949503 | 2.057081e+05 |
| Rhode Island                |   2013255 |    1059361 | 1.900443e+05 |
| Oklahoma                    |  13036365 |    3956971 | 3.294531e+05 |
| Vermont                     |   1506113 |     623989 | 2.413685e+05 |
| Indiana                     |  12864230 |    6732219 | 1.910845e+05 |
| Puerto Rico                 |   1422863 |    3193694 | 4.455226e+04 |
| Connecticut                 |  12533843 |    3565287 | 3.515521e+05 |
| West Virginia               |   1352504 |    1792147 | 7.546836e+04 |
| Tennessee                   |  12017224 |    6833174 | 1.758659e+05 |
| U.S. Virgin Islands         |    248287 |     104914 | 2.366576e+05 |
| Louisiana                   |  11932340 |    4648794 | 2.566760e+05 |
| U.S. Minor Outlying Islands |    225488 |        360 | 6.263556e+07 |
| Minnesota                   |  11920258 |    5639632 | 2.113659e+05 |
| Guam                        |     12520 |     165718 | 7.555003e+03 |
| Alabama                     |  10739652 |    4903185 | 2.190342e+05 |
| American Samoa              |       494 |      55641 | 8.878345e+02 |
| Montana                     |  10262099 |    1068778 | 9.601712e+05 |
| Northern Mariana Islands    |       315 |      55194 | 5.707142e+02 |
| South Carolina              |  10063305 |    5148714 | 1.954528e+05 |

### Files

    ## .
    ## ├── 2020-ic3.R
    ## ├── LICENSE
    ## ├── README.R
    ## ├── README.Rmd
    ## ├── README.spin.R
    ## ├── README.spin.Rmd
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
