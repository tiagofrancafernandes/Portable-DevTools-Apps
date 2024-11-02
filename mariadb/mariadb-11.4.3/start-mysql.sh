#!/bin/bash

## WIP
MYSQL_PORT=${MYSQL_PORT:-3307}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-mysql}

_invalid_data_folfer_message() {
    echo "Are you sure a database configuration was created?";
    echo "Try running install-db.sh or check the logs.";
}

if [ ! -d ./data ]; then
    echo "The ./data folder not exists!";
    _invalid_data_folfer_message;
    exit 9;
fi

if [ -z "$(ls -A ./data)" ]; then
    echo ""
    echo "Error!!."
    echo "The ./data folder is empty"
    _invalid_data_folfer_message;
    echo ""
    exit 5;
fi

echo "";
echo "MySQL client configs defaults:";
# echo "File: ./data/my.ini";
# ./bin/my_print_defaults.exe --defaults-file=./data/my.ini client client-server mysql mariadb
# ./bin/my_print_defaults.exe client client-server mysql mariadb
./bin/my_print_defaults.exe client
echo "";
echo "Starting DB...";
echo "";
echo "Press CTRL+C to stop it.";

./bin/mysqld --verbose

if [ $? -ne 0 ]; then
    echo "An error occurred";
    exit 9;
fi
