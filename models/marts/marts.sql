-- This model creates our final fact table
{{
  config(
    pre_hook="INSERT INTO audit_log (model_name, event_time) VALUES ('{{ this.name }}', CURRENT_TIMESTAMP());"
  )
}}

SELECT
    row_id AS order_line_item_key,
    order_id,
    customer_id,
    product_id,
    order_date,
    sales_amount,
    -- Example of using the macro
    {{ format_currency('profit_amount') }} AS profit_in_dollars,
    quantity
FROM {{ ref('stg_global_superstore') }}
WHERE order_date IS NOT NULL