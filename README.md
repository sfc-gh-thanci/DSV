# DSV Logistics dbt Project

A dbt project implementing a medallion architecture for DSV logistics data.

## Architecture

```
BRONZE (Raw)          SILVER (Cleaned)         GOLD (Business)
─────────────────────────────────────────────────────────────────
RAW_SHIPMENTS    →    stg_shipments       →    customer_shipment_summary
RAW_CUSTOMERS    →    stg_customers       →    shipment_metrics
```

## Models

### Silver Layer
- `stg_customers` - Cleaned customer data with standardized fields
- `stg_shipments` - Cleaned shipment data with standardized fields

### Gold Layer
- `customer_shipment_summary` - Aggregated metrics per customer
- `shipment_metrics` - Aggregated metrics by shipment status

## Usage

```bash
dbt run
dbt test
```
