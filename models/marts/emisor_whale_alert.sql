WITH CTE AS (

    SELECT 
        FROM_ADDRESS,
        SUM(value) AS ETH_VALUE,
        SUM(usd_value) AS USD_VALUE,
        COUNT(*) AS TX_ETH
    FROM {{ref("stg_usd_output")}}
    GROUP BY FROM_ADDRESS
    ORDER BY ETH_VALUE DESC

)

SELECT *
FROM CTE