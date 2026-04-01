import requests
import pandas as pd
import os

url = 'https://api.coingecko.com/api/v3/coins/ethereum/market_chart?vs_currency=usd&days=5'
response = requests.get(url)
prices = response.json()['prices']

timestamps = [p[0] for p in prices]
usd_rates = [p[1] for p in prices]

df = pd.DataFrame({
    'date': pd.to_datetime(timestamps, unit='ms').strftime('%Y-%m-%d'),
    'hour': pd.to_datetime(timestamps, unit='ms').strftime('%H'),
    'usd_rates': usd_rates
})

# ruta al directorio seeds de dbt
output_path = os.path.join('seeds', 'eth_prices.csv')

df.to_csv(output_path, index=False)

print(f"CSV generado en {output_path}")