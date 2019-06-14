# MBTA-Slope-Graph-Project

## Purpose

The purpose of this project is to produce one of the graphs that will be featured on the Lean Initiative dashboard, namely a slope graph depicting requisition count by each Buyer Team for each of the first three quarters of the 2019 MBTA Fiscal Year.

### Package Requirements

#### Software Packages 

* `R 3.5.1`

#### R Packages

* `dplyr` for data manipulation 
* `ggplot2` for data visualization
* `tidyverse` for data tidying
* `openxlsx` for reading files from Excel
* `ggrepel` for data visualization extras

### Data Requirements

This project takes 1 excel file as input:

#### `REQ_TO_PO_SPILT_PO_SIDE_PUBLIC.xlsx`

This excel file should contain the following columns:

| Columns                      | Purpose/Use                               |
| ---------------------------- | ----------------------------------------- |
| Business_Unit                | Business Unit of each requisition         |
| PO_No                        | Unique Identifier for each Purchase Order |
| PO_Line                      | Line number within that specific PO       |
| Status                       | PO Status                                 |
| PO_Date                      | Date of Purchase Order creation           |
| Buyer                        | Buyer assigned to that specific PO        |
| Origin                       | Not used                                  |
| Approved_By                  | Not used                                  |
| Mfg_ID                       | Not used                                  |
| Mfg_Itm_Id                   | Not used                                  |
| PO_Qty                       | Quanity of item purchased in that PO line |
| Sum_Amount                   | Amount spent in that PO line              |
| Level_1                      | Category of item purchased in PO          |
| Level_2                      | More specific category in Level_1 umbrella|
| Vendor_Name                  | Name of company from which we purchase    |
| Descr                        | PO description repeated on each line of PO|
| Item                         | Not used                                  |
| Req_ID                       | Unique Identifier for Req connected to PO |
| Req_Line                     | Line number within that specific Req      |
| QuoteLink                    | Not used                                  |
| Bid_Category                 | Not used                                  |
| Last_Dttm                    | Timestamp of last time PO was manipulated |
| Quarter                      | Quarter in FY when the PO was created     |
| Month                        | Abbreviation for month when PO was created|

### Output file(s)

This project produces a slope graph featuring the count of requisitions assigned to each buyer team for each of the first three quarters of the 2019 Fiscal Year, for a total of 12 data points.

![](C:/Users/NCAGLIUSO/Desktop/Req Count by Buyer Team by Quarter.png)


