with

source as (

    select * from {{ source('google_sheets', 'events') }}

),

renamed as (

    select

        --id
        _id as event_id,

        -- timing
        starttime as event_start_ts,
        endtime as event_end_ts,
        timezoneid as timezone_id,

        -- core details
        title,
        type,
        description,
        status,
        isactive as is_active,
        iscapacityset as is_capacity_set,
        communities,

        -- payment + pricing
        currency,
        pricetype as price_type,
        paymentmethods as payment_methods,
        suggestedamount as suggested_amount,
        minamount as min_amount,
        maxquantityperpurchase as max_quantity_per_purchase,

        -- links & access
        access,
        livelink as live_link,
        recordinglink as recording_link,
        countrywiseprice as country_wise_price,

        -- metadata
        _row as fivetran_row,
        _fivetran_synced as fivetran_synced_ts,

    from source

)

select * from renamed