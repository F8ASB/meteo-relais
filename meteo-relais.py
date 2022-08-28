#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
import json
api_key = "votre code API"

#Indiquer le nom de la ville ci-dessous
# Verifier sur https://openweathermap.org/weathermap que des données sont disponibles
city = "vagney"

url = 'https://api.openweathermap.org/data/2.5/weather?units=metric&q=%s&appid=%s'% (city, api_key)
response = requests.get(url)
data = json.loads(response.text)
print(data)

temperature = data["main"]["temp"]
tempmini = data["main"]["temp_min"]
tempmaxi = data["main"]["temp_max"]
pression = data["main"]["pressure"]
humidite = data["main"]["humidity"]
ventDirection = data["wind"]["deg"]
ventVitesse = data["wind"]["speed"]

print(str(temperature)[:4]+"/"+str(tempmini)[:4]+"/"+str(tempmaxi)[:4]+"/"+str(pression)+"/"+str(humidite)+"/"+str(ventDirection)+"/"+str(ventVitesse)[:-1])
