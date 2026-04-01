{% macro eth_to_usd(column_name) %}

ROUND({{column_name}} * ep.usd_rates,4)

{% endmacro %}