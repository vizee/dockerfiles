# !/bin/bash

set -e

if [ ! -d ./config ]; then
    echo missing ./config
fi

if [ ! -f pma.zip ]; then
    PMA_DOWNLOAD=https://files.phpmyadmin.net/phpMyAdmin/4.6.0/phpMyAdmin-4.6.0-all-languages.zip
    wget $PMA_DOWNLOAD -O pma.zip
fi
if [ ! -d ./app/pma ]; then
    rm -rf ./tmp/*
    unzip pma.zip -d ./tmp
    rm -rf ./app/pma
    mkdir -p ./app
    mv ./tmp/`ls ./tmp` ./app/pma
    rm -rf ./tmp
fi
docker build -t pma .

