#!/bin/bash

if [ "$#" == 0 ]; then
    echo "Country not provided. For example: $0 <country names>"
    exit 1
fi

for country in "$@"; do
    response=$(curl -s "https://restcountries.com/v3.1/name/$country")
    name=$(echo "$response" | jq -r '.[0].name.common')
    capital=$(echo "$response" | jq -r '.[0].capital[0]')
    population=$(echo "$response" | jq -r '.[0].population')
    languages=$(echo "$response" | jq -r '.[0].languages | join(", ")')
    
    echo -e "Name: $name\nCapital: $capital\nPopulation: $population\nLanguages: $languages\n" >> ../output.txt
done