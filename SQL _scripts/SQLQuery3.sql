SELECT 
    Row_ID,
    Order_ID,
    Order_Date,
    Ship_Date,
    Ship_Mode,
    Customer_Name,
    Product_ID,
    Sales,
    Quantity,
    Discount,
    Profit,
    Region
INTO dbo.FactOrders
FROM dbo.stg_Superstore_clean;
