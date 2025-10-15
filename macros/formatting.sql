-- macros/formatting.sql
{% macro format_profit(column_name) %}
    -- A simple macro to categorize profit as 'Profitable', 'Break Even', or 'Loss'
    CASE
        WHEN {{ column_name }} > 0 THEN 'Profitable'
        WHEN {{ column_name }} < 0 THEN 'Loss'
        ELSE 'Break Even'
    END
{% endmacro %}