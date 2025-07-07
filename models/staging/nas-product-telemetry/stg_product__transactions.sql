with

source as (

    select * from {{ source('google_sheets', 'raw_transactions') }}

),

renamed as (

    select
    
        -- ids
        _id as transaction_id,
        communityobjectid as community_object_id,
        entityobjectid as entity_object_id,
        learnerobjectid as learner_object_id,
        refundedtransactionreferenceid as refunded_transaction_reference_id,

        -- dates
        createdat as created_ts,
        transactioncreatedat as transaction_created_ts,
        updatedat as updated_ts,

        -- transaction details
        transactiontype as transaction_type,
        purchasetype as purchase_type,
        pricetype as price_type,
        originalcurrency as original_currency,
        originalamount as original_amount,

        -- chargeback
        ischargeback as is_chargeback,
        chargebackreason as chargeback_reason,

        -- payment info
        paymentmethod as payment_method,
        paymentprovider as payment_provider,
        paymentbrand as payment_brand,

        -- status and result
        status,
        declinecode as decline_code,
        failurecode as failure_code,
        failurereason as failure_reason,
        
        -- metadata
        _fivetran_synced as fivetran_synced_ts,
        _row as fivetran_row

    from source

)

select * from renamed