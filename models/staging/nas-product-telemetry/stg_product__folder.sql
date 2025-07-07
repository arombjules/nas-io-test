with

source as (

    select * from {{ source('google_sheets', 'folder') }}

),

renamed as (

    select * from source

)

select * from renamed