{{ config(materialized='table') }}

SELECT
    customer_id,
    TRIM(name) AS customer_name,
    UPPER(country) AS country,
    LOWER(contact_email) AS email
FROM {{ source('bronze', 'RAW_CUSTOMERS') }}
