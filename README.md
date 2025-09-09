# 🐬Sales Analysis SQL
This repository contains SQL scripts for sales data analysis, including:
- Total sales, costs, quantity, and orders
- Top products by quantity and profit
- Sales by region, category, and country
- Yearly, monthly, and quarterly sales trends
- Year-over-Year (YoY) growth
- Employee and reseller performance
- Number of Order in each Year

# 📊 Sales Analysis Dashboard

This project provides an interactive sales analysis dashboard created using **Power BI**.  
- **Calculated Measures**  
  - Profit  
  - Total Costs  
  - Total Sales
  - Year-Over-Year Sales

- **KPIs with Card Visuals**  
  - Total Sales  
  - Total Costs  
  - Total Profit
  - Total Orders
- **DAX**
  - TotalCosts = SUM(Sales[Cost])
  - TotalSales = SUM(Sales[Sale])
  - profit = [TotalSales]-[TotalCosts]
  - YoY Sales = 
CALCULATE(
    [TotalSales],
    SAMEPERIODLASTYEAR(Sales[OrderDate])
)
- YoY Change = [TotalSales] - [YoY Sales]

- **Visualizations**
  - 📊 **Clustered Column Chart**: Comparison of total sales and total costs by month.  
  - 📈 **Line Chart**: Trends of sales, costs, and profit over time.  
  - 🥧 **Pie Chart**: Quarterly order quantity distribution with tooltips showing total sales, total costs, and profit for each quarter.  
  - 📈 **Quarterly Line Chart**: Sales trends across quarters.  
  - 🔝 **Top 10 Products by Selling and Profits**: Ranking of best-performing products.  
  - 💧 **Waterfall Chart**: Profit by region (before and after profit percentage changes).  
  - 🗺️ **Map Chart**: Regional sales analysis.
  - 📈 **Line Chart**: Trends of sales Year-Over-Year.
  - 🥧 **Donut Chart** : Category wise Total sales.
  - 🟩 **Tree Map** : Total Orders in each year.

- **Interactivity**
  - **Slicer by Order Date** to dynamically filter and explore the data.
## 🛠️ Tools Used
- MySQL
- Power BI  
- DAX (for calculated measures) 
