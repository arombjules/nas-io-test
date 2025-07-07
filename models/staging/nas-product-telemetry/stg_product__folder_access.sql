with

source as (

    select * from {{ source('google_sheets', 'folder_access') }}

),

renamed as (

    select

        -- ids
        _id as folder_access_id,
        learnerobjectid as learner_object_id,
        communityobjectid as community_object_id,
        communityfolderobjectid as community_folder_object_id,

        -- timestamps
        createdat as created_ts,
        updatedat as updated_ts,

        -- metadata
        _row as fivetran_row,
        _fivetran_synced as fivetran_synced_ts,

    from source

)

select * from renamed