#!/bin/bash

cd fs15_5-ES6-TS_banking-app
if [ "$#" == 0 ]; then
    echo "Component not provided. For example: $0 <component names>"
    exit 1
fi

for component in "$@"; do
    count=$(grep -roh "$component" . | wc -l)
    echo "$component - $count" >> ../output.txt
done

# Output
# Customer - 57
# Bank - 36
# Branch - 71