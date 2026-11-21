{{ config(materialized='view') }}

WITH source_data AS (

    SELECT *
    FROM {{ source('complaints', 'raw_complaints') }}

)

SELECT
    complaint_id,
    date_received,
    product,
    sub_product,
    issue,
    sub_issue,
    company_public_narrative AS complaint_narrative,
    company_response_to_consumer,
    timely_response,
    consumer_disputed
FROM source_data
