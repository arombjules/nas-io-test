with

source as (

    select * from {{ source('google_sheets', 'challenge_participants') }}

),

renamed as (

    select * from source

)

select * from renamed