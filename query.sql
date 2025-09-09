-- ============================================
-- Create and Use Database
-- ============================================
CREATE DATABASE IF NOT EXISTS sales;
USE sales;

-- ============================================
-- View all data
-- ============================================
SELECT * FROM sales;

-- ============================================
-- Total Metrics
-- ============================================
-- Total Costs
SELECT ROUND(SUM(Cost),2) AS Total_Cost FROM sales;

-- Total Sale
SELECT ROUND(SUM(Sale),2) AS Total_Sale FROM sales;

-- Total Quantity
SELECT SUM(Quantity) AS Total_Quantity FROM sales;

-- Total Orders
SELECT COUNT(DISTINCT ï»¿OrderNumber) AS Total_Orders FROM sales;

-- Sales Summary
SELECT 
    ROUND(SUM(Sale),2) AS Total_Sale,
    ROUND(SUM(Cost),2) AS Total_Cost,
    ROUND(SUM(Sale - Cost),2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM sales;

-- ============================================
-- Top 10 Products
-- ============================================
-- By Quantity
SELECT Product, SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY Product
ORDER BY Total_Quantity DESC
LIMIT 10;

-- By Profit
SELECT Product, ROUND(SUM(Sale - Cost),2) AS Total_Profit
FROM sales
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 10;

-- ============================================
-- Sales by Region
-- ============================================
SELECT Region, ROUND(SUM(Sale),2) AS Total_Sale
FROM sales
GROUP BY Region
ORDER BY Total_Sale DESC;

-- Sales by Category
SELECT Category, 
       ROUND(SUM(Sale),2) AS Total_Sale, 
       ROUND(SUM(Sale - Cost),2) AS Total_Profit
FROM sales
GROUP BY Category
ORDER BY Total_Sale DESC;

-- ============================================
-- Yearly Sales Trend
-- ============================================
SELECT YEAR(STR_TO_DATE(OrderDate,'%m/%d/%Y')) AS Year, 
       ROUND(SUM(Sale),2) AS Total_Sale, 
       ROUND(SUM(Sale - Cost),2) AS Total_Profit
FROM sales
GROUP BY YEAR(STR_TO_DATE(OrderDate,'%m/%d/%Y'))
ORDER BY Year;

-- ============================================
-- Monthly Sales Trend (Year-wise)
-- ============================================
SELECT MonthName(STR_TO_DATE(OrderDate,'%m/%d/%Y')) AS Month, 
       ROUND(SUM(Sale)) AS Total_Sale, 
       ROUND(SUM(Sale - Cost)) AS Total_Profit
FROM sales
GROUP BY Month
ORDER BY Total_Sale DESC;



-- ============================================
-- Quarterly Sales Trend
-- ============================================
SELECT QUARTER(STR_TO_DATE(OrderDate, '%m/%d/%Y')) AS Quarter,
       ROUND(SUM(Sale),2) AS Total_Sale,
       ROUND(SUM(Sale - Cost),2) AS Total_Profit
FROM sales
GROUP BY Quarter
ORDER BY Quarter;

-- ============================================
-- Top Countries by Sales
-- ============================================
SELECT Country, ROUND(SUM(Sale),2) AS Total_Sale
FROM sales
GROUP BY Country
ORDER BY Total_Sale DESC
LIMIT 10;

-- ============================================
-- Reseller Performance
-- ============================================
SELECT ResellerKey, 
       ROUND(SUM(Sale),2) AS Total_Sale, 
       ROUND(SUM(Sale - Cost),2) AS Total_Profit
FROM sales
GROUP BY ResellerKey
ORDER BY Total_Sale DESC
LIMIT 10;

-- ============================================
-- Employee Contributions
-- ============================================
SELECT EmployeeKey, ROUND(SUM(Sale),2) AS Total_Sale
FROM sales
GROUP BY EmployeeKey
ORDER BY Total_Sale DESC
LIMIT 10;

-- ============================================
-- Year-over-Year (YoY) Growth
-- ============================================
WITH yearly_sales AS (
    SELECT YEAR(STR_TO_DATE(OrderDate,'%m/%d/%Y')) AS Year,
           ROUND(SUM(Sale),2) AS Total_Sale
    FROM sales
    GROUP BY YEAR(STR_TO_DATE(OrderDate,'%m/%d/%Y'))
)


SELECT Year,
       Total_Sale,
       Total_Sale - LAG(Total_Sale) OVER (ORDER BY Year) AS YoY_Change
FROM yearly_sales
ORDER BY Year;
-- ============================================
-- Number of Order in each Year
-- ============================================
SELECT 
    YEAR(STR_TO_DATE(OrderDate, '%m/%d/%Y')) AS Year,
    COUNT(DISTINCT ï»¿OrderNumber) AS Total_Orders
FROM sales
GROUP BY Year
ORDER BY Total_Orders DESC;
