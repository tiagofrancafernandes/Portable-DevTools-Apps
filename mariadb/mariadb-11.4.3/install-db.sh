#!/bin/bash

## WIP
FORCE_INSTALL=${FORCE_INSTALL:-0}

_show_message() {
    echo "This script is only for INSTALL. Usually on first use."
    echo ""
    echo "Make sure the 'data' folder does not exist or is completely empty."
    echo ""
    echo "Are you sure you want to continue?"
}

for i in {10..1}; do
    clear;
    _show_message;
    echo "";
    echo "Installing in ${i} seconds...";
    echo "";
    echo "Press CTRL+C to cancel it.";
    sleep 1;
done
clear;

echo "Installing database...";
sleep 1;

if [ -d ./data ]; then
    echo "Using the ./data folder";
else
    mkdir -p ./data
fi

if [ ! -z "$(ls -A ./data)" ]; then
    echo ""
    echo "Error!!."
    echo "The ./data folder is not empty"
    echo ""
    exit 5;
fi

# ./bin/mariadb-install-db.exe --config=./base-my.ini.tpl --allow-remote-root-access --default-user

./bin/mariadb-install-db.exe --config=./base-my.ini.tpl --allow-remote-root-access --default-user --password=mysql --port=3307 --socket=mysql.sock --datadir=./data

if [ $? -ne 0 ]; then
    echo "An error occurred during installation";
    exit 9;
fi

echo "";
echo "MySQL config defaults:";
./bin/my_print_defaults.exe --defaults-file=./base-my.ini.tpl client client-server mysql
echo "";
