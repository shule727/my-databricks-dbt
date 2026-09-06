with source_data as (

    select * from {{ source('raw', 'companies') }}

),

renamed as (

    select
        cast(company_id as bigint) as id,
        company_name,
        industry,
        country,
        cast(created_at as timestamp) as created_at
    from source_data

)

select * from renamed
