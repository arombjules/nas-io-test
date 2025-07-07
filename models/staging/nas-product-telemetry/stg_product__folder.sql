with

source as (

    select * from {{ source('google_sheets', 'folder') }}

),

renamed as (

    select

        -- ids and object references
        _id as folder_id,
        communityobjectid as community_object_id,
        resourceslug as resource_slug,

        -- timestamps
        createdat as created_ts,
        updatedat as updated_ts,

        -- financials
        currency,
        suggestedamount as suggested_amount,
        minamount as min_amount,
        amount as learner_chosen_amount,
        countrywiseprice as country_wise_price,

        -- event/engagement info
        accesscount as access_count,
        totalitemscount as total_items_count,
        ispurchased as is_purchased,

        -- descriptions and labels
        title as folder_title,
        description as folder_description,
        type as folder_type,
        pricetype as folder_price_type,
        timezonechosenforavailability as timezone_chosen_for_availability,
        status,

        -- metadata
        index as folder_index,
        _row as fivetran_row,
        _fivetran_synced as fivetran_synced_ts,

    from source

)

select * from renamed