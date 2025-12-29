-- Bon, on commence par créer la base de données
-- CREATE DATABASE gestion_projets;
-- USE gestion_projets;

-- Table des employés en premier parce que les autres tables en ont besoin
CREATE TABLE employe (
    id_emp INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    role VARCHAR(50)
);

-- Table projet 
-- Attention: id_chef_projet référence un employé
CREATE TABLE projet (
    id_projet INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(200) NOT NULL,
    date_deb DATE,
    date_fin DATE,
    statut VARCHAR(50),
    id_chef_projet INT,
    FOREIGN KEY (id_chef_projet) REFERENCES employe(id_emp)
);

-- Table tâche
-- Elle dépend de projet et employe
CREATE TABLE tache (
    id_tache INT PRIMARY KEY AUTO_INCREMENT,
    description TEXT,
    date_limite DATE,
    etat VARCHAR(50),
    priorite VARCHAR(20),
    id_employe INT,
    id_projet INT,
    FOREIGN KEY (id_employe) REFERENCES employe(id_emp),
    FOREIGN KEY (id_projet) REFERENCES projet(id_projet)
);

