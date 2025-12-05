#!/bin/bash

# Vérifier que .env existe
if [ ! -f .env ]; then
    echo "❌ Fichier .env manquant!"
    exit 1
fi

# Charger les variables du fichier .env
export $(grep -v '^#' .env | xargs)
set -a
source .env
set +a

# Créer les bases de données
echo "Création des bases de données..."

docker compose exec postgres psql -U admin -c "CREATE DATABASE $N8N_DB_NAME;"
docker compose exec postgres psql -U admin -c "CREATE DATABASE $APP_DB_NAME;"
docker compose exec postgres psql -U admin -c "CREATE DATABASE $GRAFANA_DB_NAME;"

echo "✅ Bases de données créées!"