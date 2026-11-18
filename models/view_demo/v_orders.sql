SELECT
    o.ORDER_PRIORITY,
    o.DISCOUNT,
    o.UNIT_PRICE,
    o.SHIPPING_COST,
    c.Customer_SK AS CUSTOMER_ID,
    c.Customer_Name
FROM
    DBT_TUTORIAL.DBT_SRC_FILES_DATA.SALES_ORDERS o
JOIN
    {{ ref('stg_customers') }} c ON o.Customer_ID = c.Customer_SK