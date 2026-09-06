with source_data as (

    select * from {{ ref('orders') }}

),

renamed as (

    select
        cast(order_id as bigint) as order_id,
        cast(customer_id as bigint) as customer_id,
        cast(order_total as decimal(18, 2)) as order_total,
        cast(created_at as timestamp) as created_at

    from source_data

)

select * from renamed
