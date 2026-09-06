{{ config(materialized='table') }}

select
    customer_id,
    count(*) as order_count,
    sum(order_total) as lifetime_value,
    max(created_at) as last_order_at
from {{ ref('stg_orders') }}
group by customer_id