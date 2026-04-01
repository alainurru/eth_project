WITH CTE AS (
    SELECT *
        -- PAYLOAD:block_hash::varchar AS block_hash
    FROM {{source('ETH','ETH_TRANSACTIONS_RAW')}}
    LIMIT 100
)

SELECT *
FROM CTE