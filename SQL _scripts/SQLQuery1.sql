-- 1. Remove duplicates
SELECT DISTINCT *
INTO dbo.stg_Superstore_clean
FROM dbo.stg_Superstore_raw;

-- 2. Standardize text fields (trim spaces)
UPDATE dbo.stg_Superstore_clean
SET Customer_Name = LTRIM(RTRIM(Customer_Name)),
    Product_Name  = LTRIM(RTRIM(Product_Name)),
    Category      = LTRIM(RTRIM(Category)),
    Sub_Category  = LTRIM(RTRIM(Sub_Category)),
    Region        = LTRIM(RTRIM(Region)),
    Country       = LTRIM(RTRIM(Country)),
    State         = LTRIM(RTRIM(State)),
    City          = LTRIM(RTRIM(City));

-- 3. Convert dates into proper DATE type
ALTER TABLE dbo.stg_Superstore_clean
ALTER COLUMN Order_Date DATE;

ALTER TABLE dbo.stg_Superstore_clean
ALTER COLUMN Ship_Date DATE;

-- 4. Handle NULLs (replace missing values with defaults)
UPDATE dbo.stg_Superstore_clean
SET Profit = 0
WHERE Profit IS NULL;

UPDATE dbo.stg_Superstore_clean
SET Discount = 0
WHERE Discount IS NULL;

-- 5. Verify cleaned data
SELECT COUNT(*) AS TotalRows FROM dbo.stg_Superstore_clean;
SELECT TOP 10 * FROM dbo.stg_Superstore_clean;
