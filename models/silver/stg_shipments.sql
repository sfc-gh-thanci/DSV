{{ config(materialized='table') }}

SELECT
    shipment_id,
    customer_id,
    UPPER(origin) AS origin_city,
    UPPER(destination) AS destination_city,
    weight_kg,
    UPPER(status) AS status,
    created_at
FROM {{ source('bronze', 'RAW_SHIPMENTS') }}
