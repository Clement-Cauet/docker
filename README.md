# Configuration d’un serveur Ubuntu avec Docker
Ce dépôt configure un serveur Ubuntu pour exécuter des services containerisés via Docker et docker compose, intégrant Traefik (reverse proxy), Prometheus (monitoring), et des scripts d’automatisation.

## Arborescence
```
~/docker-services/
├── docker-compose.yml
├── docker-compose.local.yml
├── .env
├── .env.local
├── traefik/
│   ├── traefik.yml
│   ├── traefik.local.yml
│   ├── dynamic.yml
│   └── dynamic.local.yml
├── prometheus/
│   └── prometheus.yml
└── scripts/
    ├── deploy.sh
    ├── init-databases.sh
    ├── restart.sh
    └── status.sh
```

## Prérequis
- Ubuntu Server (22.04 LTS recommandé)
- Accès SSH avec un utilisateur ayant les droits sudo
- Ports ouverts selon votre configuration (ex. : 80/443 pour Traefik)

## Installation & initialisation
Exécutez les commandes suivantes sur votre serveur :

1) Mise à jour du système
```
sudo apt update && sudo apt upgrade -y
```

3) Installation de curl
```
sudo apt install curl -y
```

5) Installation de Docker
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

4) Plugin docker compose
```
sudo apt install docker-compose-plugin -y
```

5) Création des dossiers
```
mkdir -p ~/docker-services/{traefik,prometheus,postgres,scripts}
cd ~/docker-services
```

6) Création/édition des fichiers de configuration
```
nano .env
nano docker-compose.yml
nano traefik/traefik.yml
nano traefik/dynamic.yml
nano prometheus/prometheus.yml
```

7) Création des scripts
```
nano scripts/deploy.sh && chmod +x scripts/deploy.sh
nano scripts/init-databases.sh && chmod +x scripts/init-databases.sh
nano scripts/restart.sh && chmod +x scripts/restart.sh
nano scripts/status.sh && chmod +x scripts/status.sh
```

## Scripts

### deploy.sh
Déploiement/actualisation de la stack.
```
./scripts/deploy.sh
```
### init-databases.sh
Initialisation des bases de données.
```
./scripts/init-databases.sh
```
### restart.sh
Redémarrage de la stack.
```
./scripts/restart.sh
```
### status.sh
Affiche l’état des containers.
```
./scripts/status.sh
```

## Configuration PGAdmin

1) Se connecter à PGAdmin avec les identifiants du ``.env``

2) Ajouter le serveur PostgreSQL
    - Clic droit sur Servers → Register → Server
    - Onglet General :
        - Name : Docker PostgreSQL
    - Onglet Connection :
        - Host name/address : POSTGRES_HOST
        - Port : POSTGRES_PORT
        - Maintenance database : postgres
        - Username : POSTGRES_USER
        - Password : POSTGRES_PASSWORD
        - Cocher Save password
