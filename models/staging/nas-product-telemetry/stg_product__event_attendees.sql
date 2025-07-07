with

source as (

    select * from {{ source('google_sheets', 'event_attendees') }}

),

renamed as (

    select * from source

)

select * from renamed