-- This model cleans and prepares the raw seed data
SELECT
    "Row ID" AS row_id,
    "Order ID" AS order_id,
    "Customer ID" AS customer_id,
    "Product ID" AS product_id,
    TO_DATE("Order Date", 'MM/DD/YYYY') AS order_date,
    "Sales"::DECIMAL(18, 4) AS sales_amount,
    "Quantity"::INTEGER AS quantity,
    "Discount"::DECIMAL(18, 4) AS discount_percentage,
    "Profit"::DECIMAL(18, 4) AS profit_amount
FROM {{ source('seeds', 'global_superstore') }} -- Note: We reference the source differently for seeds-- dbt intelligently finds the seed