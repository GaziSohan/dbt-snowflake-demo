WITH stg_customers AS (
    SELECT
        customer_sk,
        CONCAT(first_name, ' ', last_name) AS customer_name,
        email AS email_address,
        phone AS home_phone
    FROM {{source('source_tables','dim_customer')}}
)

SELECT * FROM stg_customers