/* ----------------------------------------------------------
   SUPERSTORE SQL PROJECT  
   Data Cleaning + Business Insights (MySQL)

   Author: Pranav Sangichetty
   ---------------------------------------------------------- */

/* ----------------------------------------------------------
   1. CREATE DATABASE & USE IT
---------------------------------------------------------- */
CREATE DATABASE IF NOT EXISTS superstore;
USE superstore;

/* ----------------------------------------------------------
   2. (Optional) RESET TABLE IF ALREADY EXISTS
---------------------------------------------------------- */
DROP TABLE IF EXISTS orders;

/* ----------------------------------------------------------
   3. TABLE STRUCTURE FOR IMPORT (Matches Superstore CSV)
---------------------------------------------------------- */
CREATE TABLE orders (
    RowID INT,
    OrderID VARCHAR(20),
    `Order Date` TEXT,
    `Ship Date` TEXT,
    `Ship Mode` TEXT,
    `Customer ID` TEXT,
    `Customer Name` TEXT,
    Segment TEXT,
    Country TEXT,
    City TEXT,
    State TEXT,
    `Postal Code` INT,
    Region TEXT,
    `Product ID` TEXT,
    Category TEXT,
    `Sub-Category` TEXT,
    `Product Name` TEXT,
    Sales DOUBLE,
    Quantity INT,
    Discount DOUBLE,
    Profit DOUBLE
);

/* ----------------------------------------------------------
   👉 Import CSV file manually using:
   MySQL Workbench → Table Data Import Wizard
---------------------------------------------------------- */

/* ----------------------------------------------------------
   4. DATA CLEANING
---------------------------------------------------------- */

-- Remove duplicates using RowID as unique identifier
ALTER TABLE orders
ADD PRIMARY KEY (RowID);

DELETE FROM orders
WHERE RowID NOT IN (
    SELECT MIN(RowID)
    FROM orders
    GROUP BY OrderID, `Product ID`
);

-- Trim extra spaces from text columns
UPDATE orders
SET 
    `Customer Name` = TRIM(`Customer Name`),
    City = TRIM(City),
    State = TRIM(State),
    Region = TRIM(Region),
    Category = TRIM(Category),
    `Sub-Category` = TRIM(`Sub-Category`);

-- Convert Order Date to proper DATE format
UPDATE orders 
SET `Order Date` = STR_TO_DATE(`Order Date`, '%m/%d/%Y')
WHERE `Order Date` IS NOT NULL;

-- Convert Ship Date to proper DATE format
UPDATE orders 
SET `Ship Date` = STR_TO_DATE(`Ship Date`, '%m/%d/%Y')
WHERE `Ship Date` IS NOT NULL;

-- Change column types to DATE
ALTER TABLE orders
MODIFY COLUMN `Order Date` DATE;

ALTER TABLE orders
MODIFY COLUMN `Ship Date` DATE;

-- Handle missing Postal Codes
UPDATE orders
SET `Postal Code` = 0
WHERE `Postal Code` IS NULL;

/* ----------------------------------------------------------
   5. BUSINESS ANALYSIS QUERIES (KPIs)
---------------------------------------------------------- */

-- Total Sales
SELECT SUM(Sales) AS Total_Sales FROM orders;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit FROM orders;

-- Total Orders
SELECT COUNT(DISTINCT OrderID) AS Total_Orders FROM orders;

-- Profit Margin %
SELECT (SUM(Profit) / SUM(Sales)) AS Profit_Margin FROM orders;

-- Sales By Category
SELECT Category, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top 10 Products by Sales
SELECT `Product Name`, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Monthly Sales Trend
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Month
ORDER BY Month;

-- Regional Sales
SELECT Region, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Segment Performance
SELECT Segment, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Category vs Profit
SELECT Category, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;

/* ----------------------------------------------------------
   6. CREATE USEFUL VIEWS FOR DASHBOARDS
---------------------------------------------------------- */

-- Category Sales View
CREATE OR REPLACE VIEW vw_category_sales AS
SELECT Category, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Category;

-- Monthly Trend View
CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Month;

-- Customer Segment View
CREATE OR REPLACE VIEW vw_segment_sales AS
SELECT Segment, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Segment;

-- Regional Profit View
CREATE OR REPLACE VIEW vw_region_profit AS
SELECT Region, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region;

/* ----------------------------------------------------------
   END OF FILE
---------------------------------------------------------- */
