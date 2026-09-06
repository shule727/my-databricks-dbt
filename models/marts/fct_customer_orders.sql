{{ config(materialized='table') }}

with orders as (

    select * from {{ ref('stg_orders') }}

),

customers as (

    select * from {{ ref('stg_customers') }}

),

companies as (
    select * from {{ ref('stg_companies') }}
),

final as (
    select
        c.id as customer_id,
        c.first_name,
        c.last_name,
        cmp.company_name,
        count(*) as order_count,
        sum(o.order_total) as lifetime_value,
        max(o.created_at) as last_order_at
    from orders as o
    inner join customers as c
        on o.customer_id = c.id
    inner join companies as cmp on c.company_id = cmp.id
    group by
        c.id,
        c.first_name,
        c.last_name,
        cmp.company_name

)

select * from final
