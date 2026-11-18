{{config(
    materialized = 'incremental',
    unique_key = 'customer_sk'
    )
}}

select 
    customer_sk,
    customer_code,
    first_name,
    last_name,
    gender,
    email,
    phone,
    loyalty_tier,
    signup_date,
    coalesce(updated_at, current_timestamp()::timestamp_ntz) as updated_at
from DBT_TUTORIAL.DBT_SRC_FILES_DATA.DIM_CUSTOMER

{% if is_incremental() %}  
where customer_sk not in (select customer_sk from {{ this }})
{% endif %}


-- {{config(materialized = 'incremental')}}

-- select * from DBT_TUTORIAL.DBT_SRC_FILES_DATA.DIM_CUSTOMER

-- {% if is_incremental() %}  
-- where updated_at > (select max(updated_at) from {{this}})
-- {% endif %}