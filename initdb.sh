#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER rhaptos;
    CREATE DATABASE repository;
    GRANT ALL PRIVILEGES ON DATABASE repository TO rhaptos;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO rhaptos;
EOSQL

cnx-db init -U $POSTGRES_USER -d repository
