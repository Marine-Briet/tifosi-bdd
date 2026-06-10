# tifosi-bdd

# Tifosi BDD — MySQL Database

Training fictional project — Designing a database for the Italian Street-Food restaurant **Tifosi**.

---

## Description

This project consists of designing and implementing a dynamic MySQL database, hosted locally, to manage data on focaccias, ingredients, brands and drinks of the **Tifosi** restaurant.

---

## Prerequisites

- MySQL (version 8.0 or higher)
- VSCode with **SQLTools** and **SQLTools MySQL Driver** extensions

---

## Installation

1. Clone the repository:
```bash
git clone https://github.com/Marine-Briet/tifosi-bdd.git
```
2. Open VSCode and connect to MySQL via SQLTools (`root@localhost`)

3. Run the scripts in the following order:
01_schema.sql   → Database and tables creation
02_data.sql     → Data insertion
03_queries.sql  → Verification queries

---

## Project structure

tifosi-bdd/
├── 01_schema.sql       # Database schema
├── 02_data.sql         # Test data
├── 03_queries.sql      # Verification queries
└── README.md

---

## Database structure

The database contains **9 tables**:

**Independent tables:** `client`, `menu`, `marque`, `ingredient`

**Tables with foreign key:** `boisson` (→ marque), `focaccia`

**Junction tables:** `focaccia_comprend_ingredient`, `menu_contient_boisson`, `client_achete_menu`

---

## Author

Marine Briet, project completed as part of the **Full Stack Web Developer** training at Centre Européen de Formation.