{{ config(materialized='view') }}

select
    cast(order_id as int) as order_id,
    cast(customer_id as int) as customer_id,
    cast(order_total as decimal(10, 2)) as order_total,
    cast(created_at as timestamp) as created_at
from {{ ref('orders') }}
