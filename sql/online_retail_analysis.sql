-- *************
-- Online Retail Sales Analysis
-- Portfolio Project
-- Tool: SQLite / DB Browser for SQLite
--
-- Purpose:
-- Explore and clean the UCI Online Retail dataset using SQL.
-- Business calculations and visualizations are created in Tableau.
-- *************


-- -----------------------------------------------------------
-- 1. DATA EXPLORATION
-- -----------------------------------------------------------

-- Total number of rows
SELECT COUNT(*) AS total_rows
FROM online_retail;


-- Number of unique invoices
SELECT COUNT(DISTINCT InvoiceNo) AS unique_invoices
FROM online_retail;


-- Number of unique products
SELECT COUNT(DISTINCT StockCode) AS unique_products
FROM online_retail;


-- Number of unique customers
SELECT COUNT(DISTINCT CustomerID) AS unique_customers
FROM online_retail;


-- Number of countries
SELECT COUNT(DISTINCT Country) AS countries
FROM online_retail;


-- -----------------------------------------------------------
-- 2. DATA QUALITY INVESTIGATION
-- -----------------------------------------------------------

-- Missing Customer IDs
SELECT COUNT(*) AS missing_customer_ids
FROM online_retail
WHERE CustomerID IS NULL;


-- Cancelled transactions
-- Invoice numbers beginning with C represent cancellations.
SELECT COUNT(*) AS cancelled_transactions
FROM online_retail
WHERE InvoiceNo LIKE 'C%';


-- Negative quantities
SELECT COUNT(*) AS negative_quantities
FROM online_retail
WHERE Quantity < 0;


-- Invalid or zero prices
SELECT COUNT(*) AS invalid_prices
FROM online_retail
WHERE UnitPrice <= 0;


-- Missing product descriptions
SELECT COUNT(*) AS missing_descriptions
FROM online_retail
WHERE Description IS NULL;


-- -----------------------------------------------------------
-- 3. DUPLICATE INVESTIGATION
-- -----------------------------------------------------------

-- Identify exact duplicate transaction records.
SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    COUNT(*) AS duplicate_count
FROM online_retail
GROUP BY
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
HAVING COUNT(*) > 1;


-- -----------------------------------------------------------
-- 4. CREATE CLEAN DATASET
-- -----------------------------------------------------------
--
-- Cleaning decisions:
--
-- 1. Exclude cancelled invoices.
-- 2. Exclude transactions with Quantity <= 0.
-- 3. Exclude transactions with UnitPrice <= 0.
-- 4. Remove exact duplicate rows.
-- 5. Keep missing CustomerIDs for overall sales analysis.
-- 6. Customer-level analysis will exclude NULL CustomerIDs.
--

-- -----------------------------------------------------------

CREATE TABLE online_retail_clean AS
SELECT DISTINCT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
FROM online_retail
WHERE
    InvoiceNo NOT LIKE 'C%'
    AND Quantity > 0
    AND UnitPrice > 0;


-- ============================================================
-- 5. VALIDATE CLEAN DATASET
-- ============================================================

-- Number of rows in cleaned dataset
SELECT COUNT(*) AS clean_rows
FROM online_retail_clean;


-- Number of unique invoices
SELECT COUNT(DISTINCT InvoiceNo) AS invoices
FROM online_retail_clean;


-- Number of unique products
SELECT COUNT(DISTINCT StockCode) AS products
FROM online_retail_clean;


-- Number of customers with CustomerID
SELECT COUNT(DISTINCT CustomerID) AS customers
FROM online_retail_clean
WHERE CustomerID IS NOT NULL;


-- Number of countries
SELECT COUNT(DISTINCT Country) AS countries
FROM online_retail_clean;


-- ============================================================
-- 6. CLEAN DATA QUALITY CHECKS
-- ============================================================

-- Confirm there are no cancelled invoices
SELECT COUNT(*) AS cancelled_rows
FROM online_retail_clean
WHERE InvoiceNo LIKE 'C%';


-- Confirm there are no invalid quantities
SELECT COUNT(*) AS invalid_quantities
FROM online_retail_clean
WHERE Quantity <= 0;


-- Confirm there are no invalid prices
SELECT COUNT(*) AS invalid_prices
FROM online_retail_clean
WHERE UnitPrice <= 0;


-- Confirm there are no remaining exact duplicates
SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    COUNT(*) AS duplicate_count
FROM online_retail_clean
GROUP BY
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
HAVING COUNT(*) > 1;


-- -----------------------------------------------------------
-- END OF ANALYSIS
-- -----------------------------------------------------------
