-- ==========================================
-- 1. ESTRUCTURA (DDL)
-- ==========================================

CREATE TABLE Localidades (
    CP INT PRIMARY KEY,
    Localidad NVARCHAR(60) NOT NULL
);

CREATE TABLE Pasajeros (
    ID_Pasajero INT IDENTITY(1,1) PRIMARY KEY,
    DNI NVARCHAR(10) NOT NULL,
    Nombre NVARCHAR(60) NOT NULL,
    Apellido NVARCHAR(60) NOT NULL,
    Mail NVARCHAR(100),
    Telefono NVARCHAR(60),
    Domicilio NVARCHAR(60),
    CP INT,
    CONSTRAINT FK_Pasajeros_Localidades FOREIGN KEY (CP) REFERENCES Localidades(CP)
);

CREATE TABLE Propietarios (
    ID_Propietario INT IDENTITY(1,1) PRIMARY KEY,
    CUIT NVARCHAR(11) NOT NULL,
    RazonSocial NVARCHAR(60) NOT NULL,
    CP INT,
    Nombre NVARCHAR(60),
    Apellido NVARCHAR(60),
    CONSTRAINT FK_Propietarios_Localidades FOREIGN KEY (CP) REFERENCES Localidades(CP)
);

CREATE TABLE Aviones (
    ID_Avion INT PRIMARY KEY,
    ID_Propietario INT,
    CantidadPasajeros INT,
    Tipo NVARCHAR(60),
    ModeloAnio INT,
    CONSTRAINT FK_Aviones_Propietarios FOREIGN KEY (ID_Propietario) REFERENCES Propietarios(ID_Propietario)
);

CREATE TABLE Vuelos (
    ID_Vuelo INT PRIMARY KEY,
    Origen NVARCHAR(60) NOT NULL,
    Destino NVARCHAR(60) NOT NULL,
    KM INT,
    Fecha DATE NOT NULL,
    HoraSalida NVARCHAR(5),
    HoraLlegada NVARCHAR(5),
    ID_Avion INT,
    CONSTRAINT FK_Vuelos_Aviones FOREIGN KEY (ID_Avion) REFERENCES Aviones(ID_Avion)
);

CREATE TABLE Vuelos_Pasajeros (
    ID_Vuelo INT,
    ID_Pasajero INT,
    PRIMARY KEY (ID_Vuelo, ID_Pasajero),
    CONSTRAINT FK_VP_Vuelos FOREIGN KEY (ID_Vuelo) REFERENCES Vuelos(ID_Vuelo),
    CONSTRAINT FK_VP_Pasajeros FOREIGN KEY (ID_Pasajero) REFERENCES Pasajeros(ID_Pasajero)
);


-- ==========================================
-- 2. DATOS (DML)
-- ==========================================

INSERT INTO Localidades (CP, Localidad) VALUES 
(1000, 'CABA'), (2000, 'Rosario'), (5000, 'Cordoba'), (5500, 'Mendoza'), (7600, 'Mar del Plata');

SET IDENTITY_INSERT Propietarios ON;
INSERT INTO Propietarios (ID_Propietario, CUIT, RazonSocial, CP, Nombre, Apellido) VALUES 
(1, '30712345678', 'AeroSur Líneas Aéreas', 1000, 'Carlos', 'Gomez'),
(2, '20123456789', 'Vuelos Privados Gomez', 2000, 'Marta', 'Lopez'),
(3, '30987654321', 'SkyJet Argentina', 5000, 'Roberto', 'Perez');
SET IDENTITY_INSERT Propietarios OFF;

INSERT INTO Aviones (ID_Avion, ID_Propietario, CantidadPasajeros, Tipo, ModeloAnio) VALUES 
(1, 1, 150, 'Boeing 737', 2015), (2, 1, 180, 'Airbus A320', 2018), 
(3, 2, 12, 'Learjet 60', 2010), (4, 2, 8, 'Cessna Citation', 2020), 
(5, 3, 200, 'Boeing 737 MAX', 2022);

-- Agregamos un vuelo en marzo para que la consulta 09 funcione
INSERT INTO Vuelos (ID_Vuelo, Origen, Destino, KM, Fecha, HoraSalida, HoraLlegada, ID_Avion) VALUES 
(101, 'Rosario', 'CABA', 300, '2026-05-10', '08:00', '08:50', 2),
(102, 'CABA', 'Cordoba', 700, '2026-05-10', '10:30', '11:45', 1),
(103, 'Rosario', 'Mendoza', 900, '2026-05-11', '09:00', '10:30', 5),
(104, 'Mar del Plata', 'CABA', 400, '2026-05-12', '18:00', '19:00', 3),
(105, 'Cordoba', 'Mendoza', 600, '2026-05-12', '14:00', '15:10', 4),
(106, 'CABA', 'Rosario', 300, '2026-03-15', '12:00', '12:50', 2); -- Vuelo de Marzo

SET IDENTITY_INSERT Pasajeros ON;
INSERT INTO Pasajeros (ID_Pasajero, DNI, Nombre, Apellido, Mail, Telefono, Domicilio, CP) VALUES 
(1, '35111222', 'Juan', 'Perez', 'juanp@mail.com', '3415550001', 'San Martin 123', 2000),
(2, '36222333', 'Maria', 'Gomez', 'mariag@mail.com', '1145550002', 'Belgrano 456', 1000),
(3, '37333444', 'Carlos', 'Lopez', 'carlosl@mail.com', '3515550003', 'Colon 789', 5000),
(4, '38444555', 'Ana', 'Martinez', 'anam@mail.com', '2235550004', 'Luro 101', 7600),
(5, '39555666', 'Luis', 'Rodriguez', 'luisr@mail.com', '2615550005', 'San Martin 202', 5500),
(6, '40666777', 'Laura', 'Fernandez', 'lauraf@mail.com', '3415550006', 'Pellegrini 303', 2000),
(7, '41777888', 'Diego', 'Garcia', 'diegog@mail.com', '1145550007', 'Corrientes 404', 1000),
(8, '42888999', 'Sofia', 'Diaz', 'sofiad@mail.com', '3515550008', 'Velez Sarsfield 505', 5000),
(9, '43999000', 'Pablo', 'Alvarez', 'pabloa@mail.com', '2235550009', 'Independencia 606', 7600),
(10, '44000111', 'Lucia', 'Romero', 'luciar@mail.com', '2615550010', 'Las Heras 707', 5500),
(11, '35111223', 'Matias', 'Ruiz', 'matiasr@mail.com', '3415550011', 'Oroño 808', 2000),
(12, '36222334', 'Florencia', 'Suarez', 'flors@mail.com', '1145550012', 'Santa Fe 909', 1000),
(13, '37333445', 'Javier', 'Torres', 'javiert@mail.com', '3515550013', 'General Paz 111', 5000),
(14, '38444556', 'Camila', 'Acosta', 'camilaa@mail.com', '2235550014', 'Rivadavia 222', 7600),
(15, '39555667', 'Nicolas', 'Medina', 'nicolasm@mail.com', '2615550015', 'Sarmiento 333', 5500),
(16, '40666778', 'Valeria', 'Flores', 'valeriaf@mail.com', '3415550016', 'Cordoba 444', 2000),
(17, '41777889', 'Martin', 'Rojas', 'martinr@mail.com', '1145550017', 'Callao 555', 1000),
(18, '42888990', 'Julieta', 'Molina', 'julietam@mail.com', '3515550018', 'Illia 666', 5000),
(19, '43999001', 'Facundo', 'Castro', 'facundoc@mail.com', '2235550019', 'Paso 777', 7600),
(20, '44000112', 'Micaela', 'Ortiz', 'micaelao@mail.com', '2615550020', 'Mitre 888', 5500),
(21, '35111224', 'Ezequiel', 'Silva', 'ezequiels@mail.com', '3415550021', 'Mendoza 999', 2000),
(22, '36222335', 'Rocio', 'Nuñez', 'rocion@mail.com', '1145550022', 'Florida 121', 1000),
(23, '37333446', 'Gonzalo', 'Gimenez', 'gonzalog@mail.com', '3515550023', 'Sabattini 232', 5000),
(24, '38444557', 'Antonella', 'Rios', 'antonellar@mail.com', '2235550024', 'Constitucion 343', 7600),
(25, '39555668', 'Tomas', 'Herrera', 'tomash@mail.com', '2615550025', 'Pueyrredon 454', 5500),
(26, '40666779', 'Paula', 'Juarez', 'paulaj@mail.com', '3415550026', 'Salta 565', 2000),
(27, '41777880', 'Gaston', 'Vargas', 'gastonv@mail.com', '1145550027', 'Uruguay 676', 1000),
(28, '42888991', 'Emilia', 'Quiroga', 'emiliaq@mail.com', '3515550028', 'Estrada 787', 5000),
(29, '43999002', 'Leandro', 'Paz', 'leandrop@mail.com', '2235550029', 'Libertad 898', 1000),
(30, '44000113', 'Candela', 'Guzman', 'candelag@mail.com', '2615550030', 'Boulogne Sur Mer 909', 2000),
(31, '35111225', 'Agustin', 'Aguirre', 'agustina@mail.com', '3415550031', 'Urquiza 112', 2000),
(32, '36222336', 'Milagros', 'Peralta', 'milagrosp@mail.com', '1145550032', 'Lavalle 223', 1000),
(33, '37333447', 'Ignacio', 'Ledesma', 'ignaciol@mail.com', '3515550033', 'Recta Martinoli 334', 5000),
(34, '38444558', 'Daniela', 'Vega', 'danielav@mail.com', '2235550034', 'Juan B Justo 445', 1000),
(35, '39555669', 'Federico', 'Soria', 'federicos@mail.com', '2615550035', 'Godoy Cruz 556', 2000),
(36, '40666770', 'Agustina', 'Dominguez', 'agustinad@mail.com', '3415550036', 'San Lorenzo 667', 2000),
(37, '41777881', 'Joaquin', 'Ramos', 'joaquinr@mail.com', '1145550037', 'Cerrito 778', 1000),
(38, '42888992', 'Delfina', 'Blanco', 'delfinab@mail.com', '3515550038', 'Rafael Nuñez 889', 5000),
(39, '43999003', 'Rodrigo', 'Mendez', 'rodrigom@mail.com', '2235550039', 'Luro 990', 1000),
(40, '44000114', 'Victoria', 'Cabrera', 'victoriac@mail.com', '2615550040', 'Peru 101', 2000),
(41, '35111226', 'Emanuel', 'Luna', 'emanuell@mail.com', '3415550041', 'Laprida 212', 2000),
(42, '36222337', 'Josefina', 'Coronel', 'josefinac@mail.com', '1145550042', 'Parana 323', 1000),
(43, '37333448', 'Mariano', 'Ibañez', 'marianoi@mail.com', '3515550043', 'Caraffa 434', 5000),
(44, '38444559', 'Celeste', 'Godoy', 'celesteg@mail.com', '2235550044', 'Colon 545', 1000),
(45, '39555660', 'Franco', 'Mendoza', 'francom@mail.com', '2615550045', 'Garibaldi 656', 2000),
(46, '40666771', 'Belen', 'Figueroa', 'belenf@mail.com', '3415550046', 'Maipu 767', 2000),
(47, '41777882', 'Julian', 'Mansilla', 'julianm@mail.com', '1145550047', 'Talcahuano 878', 1000),
(48, '42888993', 'Guadalupe', 'Quiroga', 'guadalupeq@mail.com', '3515550048', 'San Juan 989', 5000),
(49, '43999004', 'Sebastian', 'Ponce', 'sebastianp@mail.com', '2235550049', 'San Martin 090', 1000),
(50, '44000115', 'Sol', 'Gimenez', 'solg@mail.com', '2615550050', 'Alvear 191', 2000);
SET IDENTITY_INSERT Pasajeros OFF;

INSERT INTO Vuelos_Pasajeros (ID_Vuelo, ID_Pasajero) VALUES 
(101, 1), (101, 2), (101, 6), (101, 7), (101, 11), (101, 12), (101, 16), (101, 17), (101, 21), (101, 22),
(102, 3), (102, 8), (102, 13), (102, 18), (102, 23), (102, 28), (102, 33), (102, 38), (102, 43), (102, 48),
(103, 4), (103, 5), (103, 9), (103, 10), (103, 14), (103, 15), (103, 19), (103, 20), (103, 24), (103, 25),
(104, 26), (104, 27), (104, 31), (104, 32), (104, 36), (104, 37), (104, 41), (104, 42), (104, 46), (104, 47),
(105, 29), (105, 30), (105, 34), (105, 35), (105, 39), (105, 40), (105, 44), (105, 45), (105, 49), (105, 50),
(102, 1), (103, 1), (104, 1), (103, 2), (105, 2), (104, 3), (106, 1), (106, 2);