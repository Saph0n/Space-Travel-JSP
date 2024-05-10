-- Active: 1701643173794@@127.0.0.1@3306@museorazzi
-- SQLBook: Code
CREATE DATABASE MuseoRazzi;

USE MuseoRazzi;



CREATE TABLE IF NOT EXISTS razzi (
    id INT AUTO_INCREMENT, 
    nome VARCHAR(255), 
    descrizione TEXT, 
    foto VARCHAR(10000), 
    PRIMARY KEY(id)
);

-- Creazione della tabella degli utenti
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT,
    username VARCHAR(255),
    password VARCHAR(255),
    nome VARCHAR(255),
    cognome VARCHAR(255),
    PRIMARY KEY(id)
);

-- Creazione della tabella delle prenotazioni dei razzi
CREATE TABLE IF NOT EXISTS prenotazioni (
    idPrenotazione INT AUTO_INCREMENT,
    id_utente INT,
    id_razzo INT,
    data_prenotazione DATE,
    FOREIGN KEY (id_utente) REFERENCES users(id),
    FOREIGN KEY (id_razzo) REFERENCES razzi(id),
    PRIMARY KEY(idPrenotazione)
);

ALTER TABLE razzi
MODIFY foto VARCHAR(10000);

ALTER TABLE razzi
ADD posti INT;
