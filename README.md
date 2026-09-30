# Online Retail Sales Analysis

## Project Overview

This project analyzes transactional data from an online retailer to understand sales performance, product performance, geographic revenue distribution, and customer purchasing behavior.
The project displays a data analysis workflow using SQL for data cleaning and exploration and Tableau for calculations, analysis, and visualization.

---

## Business Objective

The objective of this analysis is to identify patterns in sales and customer behavior that could help an online retailer better understand its revenue performance, products, markets, and customers.

## Business questions

   - How does revenue change over time?
   - Which products generate the most revenue?
   - Which products sell the most units?
   - Which countries generate the most revenue?
   - Which customers generate the most revenue?
   - Which customers place the most orders?
   - What is the average order value?


## Data Sources Description

Dataset: The dataset used for this project is the **Online Retail** dataset from the UCI Machine Learning Repository.

**Source:** 
https://archive.ics.uci.edu/dataset/352/online+retail

The dataset contains structured transactional records from a UK based online retailer covering December 2010 through December 2011, stored in an Excel file. 

### Data Fields:

| Field | Description |
|---|---|
| InvoiceNo | Invoice/transaction number |
| StockCode | Product code |
| Description | Product description |
| Quantity | Number of units purchased |
| InvoiceDate | Date and time of transaction |
| UnitPrice | Price per unit |
| CustomerID | Customer identifier |
| Country | Customer country |

Note: Prices are recorded in GBP (£).


## Tools Used 

- Excel/CSV: data storage and transfer.
- SQL / SQLite: data exploration, quality checks, cleaning, and validation.
- Tableau: calculated fields, analysis, visualization, and dashboards.
- GitHub: project documentation and version control


## Data Cleaning and Preparation

The original dataset contained **541,909** transaction rows.

The following data-quality issues were investigated using SQL:

- Missing Customer IDs
- Cancelled transactions
- Negative quantities
- Invalid prices
- Duplicate records
- Missing product descriptions

### Cleaning decisions

The following records were excluded from the analytical dataset:

- Cancelled invoices (InvoiceNo beginning with C)
- Transactions with Quantity <= 0
- Transactions with UnitPrice <= 0
- Exact duplicate records.

Transactions with missing Customer IDs were retained because they can still contribute to overall sales, product, and country analysis. They were excluded only from customer level analysis because the customer cannot be identified.

The final cleaned dataset contains:

**524,878 rows**

The original raw table was left unchanged, and a separate cleaned table was created using SQL.

---

## SQL Workflow 

SQL was used to:

1. Explore the original dataset
2. Investigate data quality
3. Identify duplicate records
4. Create the cleaned dataset
5. Validate the cleaned data

The complete SQL workflow is available in:

sql/online_retail_analysis.sql

---

## Tableau Analysis 

The Tableau workbook contains two dashboards.


### Executive Overview 

The Executive Overview provides a high-level view of sales performance and includes:

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Monthly Revenue Trend
- Top Products by Revenue
- Top Products by Units Sold
- Top Countries by Revenue

### Customer Analysis ###

The Customer Analysis dashboard focuses on customer purchasing behavior and includes:

- Customer Revenue
- Customer Order Frequency
- Customer Summary
- Revenue by Customer
- Orders by Customer
- Average Order Value

A Top 20 customer view was used to focus the customer analysis on the highest-revenue customers.



### Key Performance Indicators 

The cleaned dataset produced the following overall metrics in Tableau:


| KPI | Result |
|---|---|
| Revenue | £10,642,110.80 |
| Orders | 19,960 |
| Customers | 4,338 |
| Average Order Value | £533.17 |


### Key Findings

### Revenue trend

Revenue fluctuated throughout the period but increased substantially toward the latter part of 2011.
November 2011 recorded the highest monthly revenue at approximately £1.50 million.
December should be interpreted cautiously because the dataset only contains transactions through December 9, 2011.

### Product performance

Product performance differed depending on the metric used.

PAPER CRAFT, LITTLE BIRDIE was the highest-volume product at approximately 81,000 units sold and generated approximately £168,000 in revenue.

DOTCOM POSTAGE generated the highest revenue among the products shown, at approximately £206,000, despite not appearing among the top products by units sold.
This demonstrates why both revenue and sales volume are useful when evaluating product performance.

### Geographic performance

Revenue was highly concentrated in the United Kingdom, which generated approximately £9.00 million, or roughly 85% of total revenue.
The Netherlands, EIRE, Germany, and France were the next largest revenue generating countries, although each contributed noticeably less than the UK.

### Customer performance

Customer value varied substantially.

The highest revenue customer generated approximately £280,206 across 73 orders.

However, the customer with the most orders placed 209 orders, demonstrating that the highest revenue customer and the most frequent customer were not the same.

Some customers also had exceptionally high average order values because their revenue was generated from only one or two orders. These cases would deserve further investigation before drawing conclusions about typical customer behavior.


## Limitations

**Partial December data:** The dataset ends on December 9, 2011, so December revenue cannot be compared directly with complete months.

**Missing customer identifiers:** Some transactions do not contain a Customer ID. These transactions were retained for overall sales analysis but excluded from customer level analysis.

**Product descriptions:** Product level analysis relies on product descriptions, and some descriptions represent services or non-standard items, such as postage.


## Future Analysis

Possible extensions of this project include:

- Customer retention and repeat-purchase analysis
- Customer segmentation
- Product profitability analysis, if cost data becomes available
- Seasonal purchasing patterns


--- 

**Link to the workbook in Tableau Public :**   

https://public.tableau.com/views/OnlineRetailSales_17907068545830/OnlineRetailSalesOverview?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

---

## Project Structure

```
online-retail-analysis/
│
├── README.md
│
├── data/
│   ├── README.md
│   └── online_retail_clean.csv
│
├── sql/
│   └── online_retail_analysis.sql
│
└── tableau/
    ├── README.md
    └── online_retail_dashboard.twbx

```


## Project Workflow    

```
Raw Dataset
     ↓
SQL Data Exploration
     ↓
Data Quality Investigation
     ↓
SQL Cleaning
     ↓
Clean Dataset
     ↓
Tableau Calculations
     ↓
Tableau Analysis
     ↓
Dashboards
     ↓
Business Insights

```


## Conclusion

This project demonstrates an end-to-end data analysis workflow using SQL and Tableau.

SQL was used to investigate and prepare the data while Tableau was used to calculate business metrics, explore patterns, and communicate findings through dashboards.

The analysis highlights differences in product performance, strong geographic concentration of revenue, and substantial variation in customer purchasing behavior.

The project also identifies several opportunities for deeper analysis, particularly around customer retention, segmentation, and purchasing behavior.

