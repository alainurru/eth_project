WITH CTE AS (

    SELECT t.*, ep.usd_rates, {{eth_to_usd('t.value')}} AS usd_value
    FROM {{ref('first_stg_model')}} t
    LEFT JOIN {{ref('eth_prices')}} ep
    ON t.date = ep.date AND t.hour = ep.hour

)

SELECT * 
FROM CTE