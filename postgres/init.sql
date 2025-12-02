-- Script d'initialisation pour créer plusieurs bases de données
CREATE DATABASE n8n_db;
CREATE DATABASE app_db;
CREATE DATABASE grafana_db;

-- Accorder tous les privilèges
GRANT ALL PRIVILEGES ON DATABASE n8n_db TO admin;
GRANT ALL PRIVILEGES ON DATABASE app_db TO admin;
GRANT ALL PRIVILEGES ON DATABASE grafana_db TO admin;