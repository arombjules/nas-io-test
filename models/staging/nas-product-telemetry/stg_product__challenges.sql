with

source as (

    select * from {{ source('google_sheets', 'challenge') }}

),

renamed as (

    select * from source

)

select * from renamed