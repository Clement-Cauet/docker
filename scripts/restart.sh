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

# Arrêter les anciens containers
echo "⏸️  Arrêt des containers existants..."
docker compose down

# Démarrage des services
echo "▶️  Démarrage des services..."
docker compose up -d

echo "✨ Déploiement terminé!"
echo "📋 Services accessibles:"
echo "  - Traefik: https://$TRAEFIK_HOST"
echo "  - Portainer: https://$PORTAINER_HOST"
echo "  - PGAdmin: https://$PGADMIN_HOST"
echo "  - Grafana: https://$GRAFANA_HOST"
echo "  - Prometheus: https://$PROMETHEUS_HOST"
echo "  - Uptime Kuma: https://$UPTIME_HOST"
echo "  - n8n: https://$N8N_HOST"