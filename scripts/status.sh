#!/bin/bash

echo "📊 État des services Docker"
echo "=============================="
docker compose ps

echo ""
echo "💾 Utilisation des ressources"
echo "=============================="
docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}"

echo ""
echo "🗄️  Utilisation des volumes"
echo "=============================="
docker system df -v | grep "VOLUME NAME" -A 20