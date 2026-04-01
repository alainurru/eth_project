WITH CTE AS (
    SELECT
        PAYLOAD:block_hash::varchar AS block_hash,
        PAYLOAD:block_number::integer AS block_number,
        PAYLOAD:block_timestamp::timestamp AS block_timestamp,
        PAYLOAD:date::date AS date,
        HOUR(TO_TIMESTAMP(PAYLOAD:block_timestamp)) AS hour,
        PAYLOAD:from_address::varchar AS from_address,
        PAYLOAD:to_address::varchar AS to_address,
        TO_NUMBER(PAYLOAD:value::varchar) / 1000000000000000000 AS value        
    FROM {{source('ETH','ETH_TRANSACTIONS_RAW')}}
    LIMIT 100
)

SELECT *
FROM CTE