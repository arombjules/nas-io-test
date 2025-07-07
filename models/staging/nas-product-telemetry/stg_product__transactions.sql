with

source as (

    select * from {{ source('google_sheets', 'raw_transactions') }}

),

renamed as (

    select * from source

)

select * from renamed