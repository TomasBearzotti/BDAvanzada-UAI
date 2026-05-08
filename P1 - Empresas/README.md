# Practico1-BDA-Empresa

Este repositorio contiene el diseño, la creación y las consultas SQL correspondientes a una base de datos relacional para gestionar el área de pedidos de una empresa comercializadora.

El archivo principal `Practico1_Empresa.sql` contiene la estructura completa (DDL), la carga de datos de prueba (DML) y las restricciones de integridad (FK, Checks). Las consultas de resolución de ítems se encuentran detalladas en el otro archivo `Consultas.sql`.

---

## Resolución de Consultas

### 04 Mostrar todas las localidades (sin repetir) en las que existen proveedores.

|Nombre_Ciudad|
|-------------|
|Rosario|
|CABA|
|Mendoza|
|Salta|

### 05 Mostrar proveedores ordenados por razón social.

|ID_Proveedor|Nombre|Telefono|ID_Ciudad|
|------------|------|--------|---------|
|2|LogiCorp|1142223333|2|
|3|Norte Distribuciones|3874999888|5|
|4|Sur Industrial|2614555444|4|
|1|TechSupply S.A.|3414555111|1|

### 06 Mostrar id_producto y peso de los productos 8 y 11.

|ID_Producto|Peso|
|-----------|----|
|8|4.50|
|11|1.20|

### 07 Calcular el promedio de peso de todos los productos.

|Promedio_Peso|
|-------------|
|5.210000|

### 08 Contar cuántos clientes hay por ciudad.

|Nombre_Ciudad|Cant_Clientes|
|-------------|-------------|
|Rosario|2|
|CABA|1|
|Córdoba|1|
|Mendoza|1|
|Salta|0|

### 09 Mostrar de todos los pedidos el id_pedido y fecha con su dirección completa de entrega.

|ID_Pedido|Fecha|Dom_Ent_Calle|Dom_Ent_Num|Nombre_Ciudad|
|---------|-----|-------------|-----------|-------------|
|1|2026-05-01|Av. Pellegrini|1500|Rosario|
|2|2026-05-02|Calle Falsa|123|CABA|
|3|2026-05-03|Av. Colon|450|Córdoba|
|4|2026-05-04|Av. Pellegrini|1500|Rosario|
|5|2026-05-05|Bv. Oroño|2100|Rosario|

### 10 Mostrar el nombre del proveedor afectado a cada pedido.

|ID_Pedido|Nombre_Proveedor|
|---------|----------------|
|1|TechSupply S.A.|
|2|LogiCorp|
|3|Norte Distribuciones|
|4|TechSupply S.A.|
|5|LogiCorp|
|5|Sur Industrial|
