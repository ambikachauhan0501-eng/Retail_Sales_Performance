SELECT name 
FROM sys.tables
WHERE name LIKE 'Dim%' OR name LIKE 'Fact%';
-- Preview Data
SELECT TOP 5 * FROM dbo.DimCustomer;
SELECT TOP 5 * FROM dbo.DimProduct;
SELECT TOP 5 * FROM dbo.DimRegion;
SELECT TOP 5 * FROM dbo.DimDate;
SELECT TOP 5 * FROM dbo.FactOrders;
