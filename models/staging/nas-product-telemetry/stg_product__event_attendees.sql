with

source as (

    select * from {{ source('google_sheets', 'event_attendees') }}

),

renamed as (

    select

        -- id
        _id as event_attendee_id,

        -- timestamps
        createdat as created_ts,
        approvalreviewdate as approval_review_ts,

        -- identifiers
        learnerobjectid as learner_object_id,
        eventobjectid as event_object_id,
        ticketreference as ticket_reference,

        -- event & payment
        currency,
        amount,
        quantity,
        applicationinfo as application_info,
        status,

        -- metadata
        _row,
        _fivetran_synced as fivetran_synced_ts

    from source

)

select * from renamed