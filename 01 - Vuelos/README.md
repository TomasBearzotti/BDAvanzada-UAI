# EjerVuelos-Consultas-BDA

Este repositorio contiene el diseño, la creación y las consultas SQL correspondientes a una base de datos relacional para gestionar las operaciones de una Empresa de Transporte de Personas. El esquema fue diseñado aplicando las reglas de normalización (hasta la 3FN) para evitar redundancias y asegurar la integridad de la información.

El archivo principal `Vuelos_Ejercicio.sql` contiene la estructura (DDL) y los datos de prueba (DML). Despues esta el archivo Consultas.sql con todas las consultas de las preguntas.

---

## Resolución de Consultas

### 01 Mostrar todos los propietarios de Aviones con su localidad.

|Nombre|Apellido|CUIT|Localidad|
|------|--------|----|---------|
|Carlos|Gomez|30712345678|CABA|
|Marta|Lopez|20123456789|Rosario|
|Roberto|Perez|30987654321|Cordoba|

### 02 Mostrar todos los propietarios de Aviones ordenados por apellido.

|ID_Propietario|CUIT|RazonSocial|CP|Nombre|Apellido|
|--------------|----|-----------|--|------|--------|
|1|30712345678|AeroSur Líneas Aéreas|1000|Carlos|Gomez|
|2|20123456789|Vuelos Privados Gomez|2000|Marta|Lopez|
|3|30987654321|SkyJet Argentina|5000|Roberto|Perez|

### 03 Mostrar todos los propietarios que tienen mas de un Avion y mostrar cuantos.

|Nombre|Apellido|CantidadAviones|
|------|--------|---------------|
|Carlos|Gomez|2|
|Marta|Lopez|2|

### 04 Mostrar la cantidad de pasajeros que volaron en nuestra empresa.

|TotalPasajerosUnicos|
|--------------------|
|50|

### 05 Mostrar los 3 pasajero que mas veces volaron.

|Nombre|Apellido|VuelosRealizados|
|------|--------|----------------|
|Juan|Perez|4|
|Maria|Gomez|3|
|Carlos|Lopez|2|

### 06 Mostrar aquellos pasajeros que solo volaron una vez.

|Nombre|Apellido|VuelosRealizados|
|------|--------|----------------|
|Ana|Martinez|1|
|Luis|Rodriguez|1|
|Laura|Fernandez|1|
|Diego|Garcia|1|
|Sofia|Diaz|1|
|Pablo|Alvarez|1|
|Lucia|Romero|1|
|Matias|Ruiz|1|
|Florencia|Suarez|1|
|Javier|Torres|1|
|Camila|Acosta|1|
|Nicolas|Medina|1|
|Valeria|Flores|1|
|Martin|Rojas|1|
|Julieta|Molina|1|
|Facundo|Castro|1|
|Micaela|Ortiz|1|
|Ezequiel|Silva|1|
|Rocio|Nuñez|1|
|Gonzalo|Gimenez|1|
|Antonella|Rios|1|
|Tomas|Herrera|1|
|Paula|Juarez|1|
|Gaston|Vargas|1|
|Emilia|Quiroga|1|
|Leandro|Paz|1|
|Candela|Guzman|1|
|Agustin|Aguirre|1|
|Milagros|Peralta|1|
|Ignacio|Ledesma|1|
|Daniela|Vega|1|
|Federico|Soria|1|
|Agustina|Dominguez|1|
|Joaquin|Ramos|1|
|Delfina|Blanco|1|
|Rodrigo|Mendez|1|
|Victoria|Cabrera|1|
|Emanuel|Luna|1|
|Josefina|Coronel|1|
|Mariano|Ibañez|1|
|Celeste|Godoy|1|
|Franco|Mendoza|1|
|Belen|Figueroa|1|
|Julian|Mansilla|1|
|Guadalupe|Quiroga|1|
|Sebastian|Ponce|1|
|Sol|Gimenez|1|

### 07 Mostrar las localidades en las cual residen la mayoria de nuestros pasajeros. (las 3 principales)
 
 |Localidad|CantidadResidentes|
|---------|------------------|
|Rosario|15|
|CABA|15|
|Cordoba|10|

### 08 Mostrar las 3 aeronaves mas antiguas junto con los datos de su propietario.

|ModeloAnio|TipoAvion|Nombre|Apellido|
|----------|---------|------|--------|
|2010|Learjet 60|Marta|Lopez|
|2015|Boeing 737|Carlos|Gomez|
|2018|Airbus A320|Carlos|Gomez|

### 09 Mostrar todos los vuelos de Mayo.

|ID_Vuelo|Origen|Destino|KM|Fecha|HoraSalida|HoraLlegada|ID_Avion|
|--------|------|-------|--|-----|----------|-----------|--------|
|101|Rosario|CABA|300|2026-05-10|08:00|08:50|2|
|102|CABA|Cordoba|700|2026-05-10|10:30|11:45|1|
|103|Rosario|Mendoza|900|2026-05-11|09:00|10:30|5|
|104|Mar del Plata|CABA|400|2026-05-12|18:00|19:00|3|
|105|Cordoba|Mendoza|600|2026-05-12|14:00|15:10|4|

### 10 Mostrar la catidad total de pasajeros por vuelos.

|ID_Vuelo|Origen|Destino|CantidadPasajeros|
|--------|------|-------|-----------------|
|103|Rosario|Mendoza|12|
|104|Mar del Plata|CABA|12|
|105|Cordoba|Mendoza|11|
|102|CABA|Cordoba|11|
|101|Rosario|CABA|10|
