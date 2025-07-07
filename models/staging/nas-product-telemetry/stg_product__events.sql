with

source as (

    select * from {{ source('google_sheets', 'events') }}

),

renamed as (

    select * from source

)

select * from renamed