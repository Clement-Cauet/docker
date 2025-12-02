#!/bin/bash

echo "🛑 Arrêt de tous les services..."
docker compose down

echo "🧹 Nettoyage (optionnel - décommenter si nécessaire)"
# docker system prune -f
# docker volume prune -f

echo "🔧 Configuration système pour Elasticsearch..."
sudo sysctl -w vm.max_map_count=262144

echo "🚀 Démarrage des services..."
docker compose up -d

echo "⏳ Attente du démarrage (30 secondes)..."
sleep 30

echo "📊 État des services:"
docker compose ps

echo ""
echo "📋 Services accessibles:"
echo "  - Traefik Dashboard: http://192.168.153.130:8080"
echo "  - Portainer:         http://192.168.153.130:8006"
echo "  - n8n:               http://192.168.153.130:8001"
echo "  - Application:       http://192.168.153.130:8002"
echo "  - Grafana:           http://192.168.153.130:8003"
echo "  - Prometheus:        http://192.168.153.130:8004"
echo "  - Uptime Kuma:       http://192.168.153.130:8005"
echo ""
echo "📊 Logs en temps réel:"
docker compose logs -f --tail=50