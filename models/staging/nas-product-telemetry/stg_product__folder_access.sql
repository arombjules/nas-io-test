with

source as (

    select * from {{ source('google_sheets', 'folder_access') }}

),

renamed as (

    select * from source

)

select * from renamed