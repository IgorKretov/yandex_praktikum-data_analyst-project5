import pandas as pd
import requests
from bs4 import BeautifulSoup

url = 'https://code.s3.yandex.net/learning-materials/data-analyst/festival_news/index.html'
req = requests.get(url)

soup = BeautifulSoup(req.text, 'lxml')
table = soup.find('table', attrs={'id':'best_festivals'})

rows = []

for row in table.find_all('tr'):
    rows.append([element.text for element in row.find_all('td')])

columns = rows[0]

print (columns)

# req = requests.get('https://geocode-maps.yandex.ru/1.x/?apikey=772ba4bf-f461-4e92-94cb-030d1e998f3f&geocode=Москва&format=json')
# req.json()['response']['GeoObjectCollection']['featureMember'][0]['GeoObject']['Point']['pos']
# '37.622504 55.753215'