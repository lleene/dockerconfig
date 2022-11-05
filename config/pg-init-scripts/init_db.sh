#!/usr/bin/env bash

set -e
set -u

function create_user_and_database() {
    local database=$1
    echo "Creating user and database '$database'"
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
      CREATE USER $database;
      CREATE DATABASE $database WITH OWNER $database TEMPLATE template0 ENCODING UTF8 LC_COLLATE 'en_US.UTF-8' LC_CTYPE 'en_US.UTF-8';
      GRANT ALL PRIVILEGES ON DATABASE $database TO $database;
      ALTER ROLE $database WITH LOGIN PASSWORD '$POSTGRES_PASSWORD';
EOSQL
}

if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
    echo "Creating databases: $POSTGRES_MULTIPLE_DATABASES"
    for db in $(echo "$POSTGRES_MULTIPLE_DATABASES" | tr ',' ' '); do
        create_user_and_database "$db"
    done
    echo "Multiple databases created"
fi
