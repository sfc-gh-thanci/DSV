{{ config(materialized='table') }}

SELECT
    c.customer_id,
    c.customer_name,
    c.country,
    COUNT(s.shipment_id) AS total_shipments,
    COALESCE(SUM(s.weight_kg), 0) AS total_weight_kg,
    COUNT(CASE WHEN s.status = 'DELIVERED' THEN 1 END) AS delivered_count
FROM {{ ref('stg_customers') }} c
LEFT JOIN {{ ref('stg_shipments') }} s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name, c.country
