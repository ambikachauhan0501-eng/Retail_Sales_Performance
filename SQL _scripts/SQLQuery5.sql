-- 1. Total Sales & Profit
SELECT 
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    (SUM(Profit) / NULLIF(SUM(Sales),0)) * 100 AS ProfitMarginPercent
FROM dbo.FactOrders;

-- 2. Sales by Region
SELECT 
    Region,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM dbo.FactOrders
GROUP BY Region
ORDER BY TotalSales DESC;

-- 3. Profit by Product Category
SELECT 
    p.Category,
    SUM(f.Profit) AS TotalProfit
FROM dbo.FactOrders f
JOIN dbo.DimProduct p ON f.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY TotalProfit DESC;

-- 4. Customer Segment Contribution
SELECT 
    c.Segment,
    SUM(f.Sales) AS SegmentSales,
    SUM(f.Profit) AS SegmentProfit
FROM dbo.FactOrders f
JOIN dbo.DimCustomer c ON f.Customer_Name = c.Customer_Name
GROUP BY c.Segment
ORDER BY SegmentSales DESC;

-- 5. Monthly Sales Trend
SELECT 
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS MonthlySales
FROM dbo.FactOrders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;

-- 6. Average Delivery Days
SELECT 
    AVG(DATEDIFF(DAY, Order_Date, Ship_Date)) AS AvgDeliveryDays
FROM dbo.FactOrders;
