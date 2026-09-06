{{ config(materialized='table') }}

with orders as (

    select * from {{ ref('stg_orders') }}

),

final as (
    select
        customer_id,
        count(*) as order_count,
        sum(order_total) as lifetime_value,
        max(created_at) as last_order_at
    from orders
    group by customer_id

)

select * from final
