WITH stg_customers AS (
    SELECT
        customer_sk,
        CONCAT(first_name, ' ', last_name) AS customer_name,
        email AS email_address,
        phone AS home_phone
    FROM DBT_TUTORIAL.DBT_SRC_FILES_DATA.DIM_CUSTOMER
)

SELECT * FROM stg_customers