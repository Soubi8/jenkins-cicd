#!/bin/bash

command () {
    response=$(curl --write-out %{http_code} --silent --output /dev/null https://epam.pp.ua/articles)
}

sleep 10
n=0
while [[ "$n" -lt 10 ]]
do
    command
    if [[ "$response" -eq 200 ]]
    then
        echo Status: 200 OK
        break
    fi
    sleep 10
    n=$(( n + 1 ))
done
