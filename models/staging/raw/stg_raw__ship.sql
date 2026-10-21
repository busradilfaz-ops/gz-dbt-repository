with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        cast(shipping_fee as FLOAT64) AS shipping_fee,
        logcost,
        cast(ship_cost as INT64) as ship_cost

    from source

)

select * from renamed