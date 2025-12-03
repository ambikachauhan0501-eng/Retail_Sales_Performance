-- Customer Dimension
SELECT DISTINCT Customer_Name, Segment
INTO dbo.DimCustomer
FROM dbo.stg_Superstore_clean;

-- Product Dimension
SELECT DISTINCT Product_ID, Product_Name, Category, Sub_Category
INTO dbo.DimProduct
FROM dbo.stg_Superstore_clean;

-- Region Dimension
SELECT DISTINCT Country, State, City, Region, Postal_Code
INTO dbo.DimRegion
FROM dbo.stg_Superstore_clean;

-- Date Dimension (Order + Ship Dates)
SELECT DISTINCT Order_Date, Ship_Date, Ship_Mode
INTO dbo.DimDate
FROM dbo.stg_Superstore_clean;
