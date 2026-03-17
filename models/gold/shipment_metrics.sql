{{ config(materialized='table') }}

SELECT
    status,
    COUNT(*) AS shipment_count,
    AVG(weight_kg) AS avg_weight_kg,
    SUM(weight_kg) AS total_weight_kg
FROM {{ ref('stg_shipments') }}
GROUP BY status
