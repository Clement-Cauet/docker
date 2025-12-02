#!/bin/bash

echo "Création des bases de données..."

docker compose exec postgres psql -U admin -c "CREATE DATABASE n8n_db;"
docker compose exec postgres psql -U admin -c "CREATE DATABASE app_db;"
docker compose exec postgres psql -U admin -c "CREATE DATABASE grafana_db;"

echo "✅ Bases de données créées!"