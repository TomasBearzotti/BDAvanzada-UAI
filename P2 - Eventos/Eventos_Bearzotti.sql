-- 1. Script de la BD
CREATE DATABASE Eventos_Bearzotti;
GO
USE Eventos_Bearzotti;

CREATE TABLE ADM_Paises (
    id_pais INT PRIMARY KEY,
    nombre_pais NVARCHAR(100) NOT NULL
);

CREATE TABLE ADM_Ciudades (
    id_ciudad INT PRIMARY KEY,
    nomnbre_ciudad NVARCHAR(100) NOT NULL,
    id_pais INT CONSTRAINT FK_Ciudad_Pais FOREIGN KEY REFERENCES ADM_Paises(id_pais)
);

CREATE TABLE FER_Rubros (
    id_rubro INT PRIMARY KEY,
    rubro NVARCHAR(100) NOT NULL
);

CREATE TABLE FER_Predios (
    id_predio INT PRIMARY KEY IDENTITY(1,1), 
    nombre_predio NVARCHAR(100) NOT NULL,
    id_ciudad INT CONSTRAINT FK_Predio_Ciudad FOREIGN KEY REFERENCES ADM_Ciudades(id_ciudad),
    superficie NUMERIC(9)
);

CREATE TABLE FER_Expos (
    id_feria INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    id_rubro INT CONSTRAINT FK_Expo_Rubro FOREIGN KEY REFERENCES FER_Rubros(id_rubro),
    fecha_apertura DATETIME,
    fecha_cierre DATETIME,
    id_predio INT CONSTRAINT FK_Expo_Predio FOREIGN KEY REFERENCES FER_Predios(id_predio)
);

-- 2. Insertar Datos

-- Paises
INSERT INTO ADM_Paises VALUES (1, 'Argentina'), (2, 'Brasil'), (3, 'Uruguay');

-- Ciudades
INSERT INTO ADM_Ciudades VALUES 
(1, 'Rosario', 1), (2, 'Cordoba', 1), (3, 'Montevideo', 3), 
(4, 'San Pablo', 2), (5, 'Florianopolis', 2), (6, 'Santa Fe', 1);

-- Rubros
INSERT INTO FER_Rubros VALUES (1, 'Promociones'), (2, 'Cumpleaños'), (3, 'Despedidas'), (4, 'Casamientos');

-- Predios
SET IDENTITY_INSERT FER_Predios ON;
INSERT INTO FER_Predios (id_predio, nombre_predio, id_ciudad, superficie) VALUES 
(1, 'La Posta', 1, 1200), (2, 'El Quincho', 1, 1000), (3, 'Francia', 3, 4000),
(4, 'El Palomar', 4, 2500), (5, 'La Noche', 1, 200), (6, 'La Estrella', 2, 5000), (7, 'El Establo', 6, 600);
SET IDENTITY_INSERT FER_Predios OFF;

-- Exposiciones
INSERT INTO FER_Expos VALUES 
(1, 'casamiento Juan', 4, '2007-08-25', '2007-08-25', 1),
(2, 'comidas ricas', 1, '2008-04-30', '2008-05-02', 4),
(3, 'fin2004', 3, '2004-12-20', '2004-12-21', 3),
(4, 'fin2005', 3, '2008-05-14', '2008-05-15', 1),
(5, 'casamiento Ariel', 4, '2009-01-05', '2009-01-06', 2),
(6, 'cumple15', 2, '2009-04-25', '2009-04-26', 2);