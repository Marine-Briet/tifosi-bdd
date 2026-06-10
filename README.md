# tifosi-bdd

# Tifosi BDD — Base de données MySQL

Projet fictif de formation  — Conception d'une base de données pour le restaurant de Street-Food italien **Tifosi**.

---

## Description

Ce projet consiste à concevoir et implémenter une base de données MySQL dynamique, hébergée en local, afin de générer des données sur les focaccias, les ingrédients, la marque et les boissons du restaurant **Tifosi**.

---

## Prérequis

- MySQL (version 8.0 ou supérieure)
- VSCode avec les extensions **SQLTools** et **SQLTools MySQL Driver**

---

## Installation

1. Cloner le dépôt :
   ```bash
   git clone https://github.com/Marine-Briet/tifosi-bdd.git
   ```

2. Ouvrir VSCode et se connecter à MySQL via SQLTools (`root@localhost`)

3. Exécuter les scripts dans l'ordre suivant :

   ```
   01_schema.sql   → Création de la base de données et des tables
   02_data.sql     → Insertion des données
   03_queries.sql  → Requêtes de vérification
   ```

---

## Structure du projet

```
tifosi-bdd/
├── 01_schema.sql       # Schéma de la base de données
├── 02_data.sql         # Données de test
├── 03_queries.sql      # Requêtes de vérification
└── README.md
```

---

## Structure de la base de données

La base de données contient **9 tables** :

**Tables indépendantes :** `client`, `menu`, `marque`, `ingredient`

**Tables avec clé étrangère :** `boisson` (→ marque), `focaccia`

**Tables intermédiaires :** `focaccia_comprend_ingredient`, `menu_contient_boisson`, `client_achete_menu`

---

## Auteur

Marine Briet, projet réalisé dans le cadre de la formation **Développeur Web Full Stack** du Centre Européen du Formation.