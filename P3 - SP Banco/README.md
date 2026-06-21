# Práctica 3 - SP_Banco

En este repositorio se encuentra la resolución del Práctico 3, enfocado en la creación y optimización de una base de datos bancaria mediante el uso intensivo de Stored Procedures (Procedimientos Almacenados) en SQL Server.

---

## 🛠️ Resolución de la Consigna paso a paso

### 0. Estructura Inicial y DER
* **Consigna:** Crear la base de datos, claves, relaciones y diagrama.
* **Qué se hizo:** Se creó la base de datos `SP_BANCO` junto con las tablas `clientes`, `cuentas`, `movimientos` y `hco_saldos`. Se establecieron las Primary Keys (PK) y las Foreign Keys (FK) correspondientes para garantizar la integridad referencial entre las entidades.

### 1. Procedimientos de Carga de Datos
* **Consigna:** Crear procedimientos almacenados para la carga de datos (`spd_addclientes`, `spd_addcuentas`, `spd_addmovimientos`).
* **Qué se hizo:** Se implementaron tres procedimientos almacenados (SP) que reciben los datos por parámetro y ejecutan sentencias `INSERT INTO` para registrar nuevos clientes, cuentas y movimientos de forma estructurada. En los movimientos se aprovechó la propiedad `IDENTITY` para el ID.

### 2. Procedimientos de Eliminación
* **Consigna:** Crear procedimientos almacenados para eliminar datos (`spd_delclientes`, `spd_delcuentas`, `spd_delmovimientos`).
* **Qué se hizo:** Se crearon tres SPs que reciben como parámetro el ID del registro a borrar. Internamente ejecutan una sentencia `DELETE FROM` apuntando específicamente a esa Primary Key.

### 3. Procedimientos de Actualización
* **Consigna:** Crear procedimientos almacenados para actualizar datos (`spd_upclientes`, `spd_upcuentas`, `spd_upmovimientos`).
* **Qué se hizo:** Se armaron los SPs correspondientes que reciben tanto el ID del registro como los nuevos valores. Utilizan la sentencia `UPDATE` combinada con un `WHERE` para modificar únicamente la fila deseada.

### 4. Procedimiento con Parámetro de Salida
* **Consigna:** Crear el procedimiento `spu_ObtenerSaldoCuenta` que devuelva el saldo mediante un parámetro de salida.
* **Qué se hizo:** Se diseñó un SP que recibe el ID de la cuenta y utiliza un parámetro declarado con la palabra clave `OUTPUT`. Mediante un `SELECT`, captura el saldo actual de la cuenta y lo asigna a dicha variable para que pueda ser leída desde afuera (por ejemplo, con un `PRINT`).

### 5. Procedimiento de Salida de Movimientos
* **Consigna:** Crear el procedimiento `spu_MovimientoCuenta` para obtener los movimientos en una fecha determinada.
* **Qué se hizo:** Se creó un SP que recibe una variable `DATETIME`. Internamente ejecuta un `SELECT` cruzando la información de las tablas `movimientos`, `cuentas` y `clientes` mediante `INNER JOIN`. Filtra los resultados por la fecha exacta y los ordena cronológicamente de forma descendente.

### 6. Procedimiento Extendido (Generación de Texto)
* **Consigna:** Crear un procedimiento que genere un txt con los siguientes datos concatenados: Apellido_cli + nombre_cli + dni + tipo_cuenta + saldo.
* **Qué se hizo:** Se implementó el SP `spe_GenerarTextoClientes` que cruza clientes y cuentas. Utiliza el operador `+` para concatenar los strings y la función `CAST` para convertir el campo numérico (`saldo`) a texto (`NVARCHAR`), generando así una única línea de texto continuo por registro.