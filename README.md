# **Projet Symfony avec Docker, HAProxy et MariaDB**

##  Objectif du projet
Ce projet consiste à mettre en place une infrastructure web complète à l'aide de **Docker**, **HAProxy**, **Symfony** et **MariaDB**.  
L'objectif est de créer une architecture scalable avec 2 instances Symfony, une base de données MariaDB, et un load balancer HAProxy pour distribuer les requêtes. Nous allons aussi ajouter des mesures de sécurité pour assurer une haute disponibilité et protéger l’application contre les attaques.

---

## Composants utilisés
- **Symfony** : Framework PHP pour le développement d'applications web.
- **Docker** : Outil pour la conteneurisation de l'application et des services.
- **HAProxy** : Load balancer pour équilibrer les requêtes entre les instances de Symfony.
- **MariaDB** : Base de données relationnelle pour stocker les données de l'application.

---

##  Objectifs
1. **Mettre en place une application Symfony** avec une base de données MariaDB.
2. **Utiliser Docker** pour conteneuriser tous les services : Symfony, MariaDB et HAProxy.
3. **Configurer HAProxy** pour distribuer les requêtes entre deux instances Symfony.
4. **Assurer une haute disponibilité** et sécuriser l'infrastructure.
5. **Mettre en place des mesures de cybersécurité** pour protéger les services et les données.

---
## Voici une vue d'ensemble de l'architecture:

###  **Architecture du projet**
L'architecture comprend les éléments suivants :
- **2 instances Symfony** (web1 et web2), qui servent de backend pour traiter les requêtes des utilisateurs.
- **MariaDB** comme base de données partagée entre les instances Symfony.
- **HAProxy** comme load balancer qui répartit les requêtes HTTP entre les 2 instances Symfony.

---

### **🔧 Étapes du projet**

### 1. **Préparation de l'environnement Docker**
- Installer Docker et Docker Compose pour gérer l’infrastructure des conteneurs.
- Créer un fichier `docker-compose.yml` pour orchestrer les services Symfony, MariaDB et HAProxy.

### 2. **Configuration de HAProxy**
- Configurer HAProxy pour écouter sur le port 80 et répartir les requêtes entre les deux instances de Symfony via le mécanisme de "round-robin".
- Ajouter des règles de sécurité, comme limiter le nombre de connexions par seconde pour éviter les attaques DDoS.

### 3. **Création et configuration des instances Symfony**
- Utiliser l’image PHP + Apache pour créer les conteneurs Symfony.
- Configurer Symfony pour se connecter à MariaDB via une URL de connexion dans le fichier `.env`.

### 4. **Base de données MariaDB**
- Créer une base de données `symfony_db` et un utilisateur `symfony_user` avec des privilèges.
- Configurer MariaDB dans Docker pour persister les données.

### 5. **Sécurisation de l’infrastructure**
- Appliquer des pratiques de sécurité telles que :
  - Désactivation des privilèges `root` pour MariaDB.
  - Configurer des volumes pour stocker les données de manière persistante.
  - Ajouter des règles de sécurité dans HAProxy pour éviter les attaques par surcharge (DDoS).
  - Mettre en place des logs pour surveiller les accès et tentatives d’intrusion.

### 6. **Test de l'infrastructure**
- Vérifier que les requêtes sont bien équilibrées entre les deux serveurs Symfony.
- Tester la réplication des données dans MariaDB et la résilience de l’application avec HAProxy.

---

## **🔒 Mesures de sécurité**
- **Désactivation du compte root dans MariaDB** pour éviter les risques d'élévation de privilèges.
- **Configuration de HAProxy** pour gérer le SSL et forcer les connexions HTTPS.
- **Limiter le nombre de connexions par IP** pour éviter les attaques DDoS.
- **Logs et monitoring** pour suivre les tentatives d'accès et alerter en cas d'anomalie.

---
### Alexandre HOARAU
### Kevin CANO
### Brendan VISINE