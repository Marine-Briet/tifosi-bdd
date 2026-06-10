DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi;
USE tifosi;

-- Ici, on est dans un un script pur : le mdp est visible. En condition de production, on utiliserait plutôt .env pour la sécurité.
DROP USER IF EXISTS 'tifosi'@'localhost';
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'tifosi1234';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

-- Drop des tables si elles existent déjà (pour éviter les erreurs lors de la création)
DROP TABLE IF EXISTS foccacia_comprend_ingredient;
DROP TABLE IF EXISTS menu_contient_boisson;
DROP TABLE IF EXISTS client_achete_menu;
DROP TABLE IF EXISTS foccacia;
DROP TABLE IF EXISTS boisson;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS marque;
DROP TABLE IF EXISTS ingredient;

-- Création des tables
CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE marque (
    id_marque INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE client (
    id_client INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT NOT NULL
);

CREATE TABLE menu (
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL
);

CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

CREATE TABLE foccacia (
    id_foccacia INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL
);

CREATE TABLE client_achete_menu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);

CREATE TABLE menu_contient_boisson (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);

CREATE TABLE foccacia_comprend_ingredient (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_foccacia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL,
    FOREIGN KEY (id_foccacia) REFERENCES foccacia(id_foccacia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);