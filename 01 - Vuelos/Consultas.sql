-- 01_ Mostrar todos los propietarios de Aviones con su localidad.
-- Hacemos un JOIN con la tabla Localidades para traer el nombre en lugar de solo el CP.
SELECT p.Nombre, p.Apellido, p.CUIT, l.Localidad
FROM Propietarios p
JOIN Localidades l ON p.CP = l.CP;

---------------------------------------------------------

-- 02_ Mostrar todos los propietarios de Aviones ordenados por apellido.
SELECT * FROM Propietarios 
ORDER BY Apellido ASC;

---------------------------------------------------------

-- 03_ Mostrar todos los propietarios que tienen mas de un Avion y mostrar cuantos.
-- Agrupamos y contamos usando HAVING para filtrar los que tienen > 1.
SELECT p.Nombre, p.Apellido, COUNT(a.ID_Avion) AS CantidadAviones
FROM Propietarios p
JOIN Aviones a ON p.ID_Propietario = a.ID_Propietario
GROUP BY p.ID_Propietario, p.Nombre, p.Apellido
HAVING COUNT(a.ID_Avion) > 1;

---------------------------------------------------------

-- 04_ Mostrar la cantidad de pasajeros que volaron en nuestra empresa.
-- DISTINCT evita que contemos dos veces a la misma persona.
SELECT COUNT(DISTINCT ID_Pasajero) AS TotalPasajerosUnicos 
FROM Vuelos_Pasajeros;

---------------------------------------------------------

-- 05_ Mostrar los 3 pasajeros que mas veces volaron.
SELECT TOP 3 p.Nombre, p.Apellido, COUNT(vp.ID_Vuelo) AS VuelosRealizados
FROM Pasajeros p
JOIN Vuelos_Pasajeros vp ON p.ID_Pasajero = vp.ID_Pasajero
GROUP BY p.ID_Pasajero, p.Nombre, p.Apellido
ORDER BY VuelosRealizados DESC;

---------------------------------------------------------

-- 06_ Mostrar aquellos pasajeros que solo volaron una vez.
SELECT p.Nombre, p.Apellido, COUNT(vp.ID_Vuelo) AS VuelosRealizados
FROM Pasajeros p
JOIN Vuelos_Pasajeros vp ON p.ID_Pasajero = vp.ID_Pasajero
GROUP BY p.ID_Pasajero, p.Nombre, p.Apellido
HAVING COUNT(vp.ID_Vuelo) = 1;

---------------------------------------------------------

-- 07_ Mostrar las localidades en las cual residen la mayoria de nuestros pasajeros. (las 3 principales)
SELECT TOP 3 l.Localidad, COUNT(p.ID_Pasajero) AS CantidadResidentes
FROM Localidades l
JOIN Pasajeros p ON l.CP = p.CP
GROUP BY l.CP, l.Localidad
ORDER BY CantidadResidentes DESC;

---------------------------------------------------------

-- 08_ Mostrar las 3 aeronaves mas antiguas junto con los datos de su propietario.
SELECT TOP 3 a.ModeloAnio, a.Tipo AS TipoAvion, p.Nombre, p.Apellido
FROM Aviones a
JOIN Propietarios p ON a.ID_Propietario = p.ID_Propietario
ORDER BY a.ModeloAnio ASC;

---------------------------------------------------------

-- 09_ Mostrar todos los vuelos de Marzo.
-- Usamos la función MONTH() para extraer el mes de la fecha.
SELECT * FROM Vuelos 
WHERE MONTH(Fecha) = 3;

---------------------------------------------------------

-- 10_ Mostrar la cantidad total de pasajeros por vuelos.
SELECT v.ID_Vuelo, v.Origen, v.Destino, COUNT(vp.ID_Pasajero) AS CantidadPasajeros
FROM Vuelos v
JOIN Vuelos_Pasajeros vp ON v.ID_Vuelo = vp.ID_Vuelo
GROUP BY v.ID_Vuelo, v.Origen, v.Destino
ORDER BY CantidadPasajeros DESC;