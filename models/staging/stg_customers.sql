with source_data as (
    select * from {{ ref('raw_customers') }}
),

renamed as (
    select
        id,
        first_name,
        last_name,
        email,
        cast(created_at as timestamp) as created_at
    from source_data
)

select * from renamed
