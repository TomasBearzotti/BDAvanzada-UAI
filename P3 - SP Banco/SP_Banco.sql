-- 1. Script de la BD
CREATE DATABASE SP_BANCO;
GO

USE SP_BANCO;
GO

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    apellido_cli NVARCHAR(100),
    nombre_cli NVARCHAR(100),
    dni NVARCHAR(20),
    telefono NVARCHAR(50),
    fecha_nac DATETIME
);
GO

CREATE TABLE cuentas (
    id_cuenta INT PRIMARY KEY,
    id_cliente INT,
    tipo_cuenta NVARCHAR(50),
    saldo DECIMAL(18,2),
    CONSTRAINT FK_Cuentas_Clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
GO

CREATE TABLE movimientos (
    id_movimiento INT PRIMARY KEY IDENTITY(1,1), -- Generalmente los movimientos son autonuméricos
    id_cuenta INT,
    saldo_ant DECIMAL(18,2),
    saldo_post DECIMAL(18,2),
    importe DECIMAL(18,2),
    fecha_mov DATETIME,
    CONSTRAINT FK_Movimientos_Cuentas FOREIGN KEY (id_cuenta) REFERENCES cuentas(id_cuenta)
);
GO

CREATE TABLE hco_saldos (
    id_cuenta INT,
    saldo DECIMAL(18,2),
    fxsaldo DATETIME,
    CONSTRAINT FK_HcoSaldos_Cuentas FOREIGN KEY (id_cuenta) REFERENCES cuentas(id_cuenta)
);
GO

-- 2 Procedimientos almacenados creacionales
-- a) Procedimiento para cargar Clientes
CREATE PROCEDURE spd_addclientes
    @id_cliente INT,
    @apellido_cli NVARCHAR(100),
    @nombre_cli NVARCHAR(100),
    @dni NVARCHAR(20),
    @telefono NVARCHAR(50),
    @fecha_nac DATETIME
AS
BEGIN
    INSERT INTO clientes (id_cliente, apellido_cli, nombre_cli, dni, telefono, fecha_nac)
    VALUES (@id_cliente, @apellido_cli, @nombre_cli, @dni, @telefono, @fecha_nac);
END;
GO

-- b) Procedimiento para cargar Cuentas
CREATE PROCEDURE spd_addcuentas
    @id_cuenta INT,
    @id_cliente INT,
    @tipo_cuenta NVARCHAR(50),
    @saldo DECIMAL(18,2)
AS
BEGIN
    INSERT INTO cuentas (id_cuenta, id_cliente, tipo_cuenta, saldo)
    VALUES (@id_cuenta, @id_cliente, @tipo_cuenta, @saldo);
END;
GO

-- c) Procedimiento para cargar Movimientos
CREATE PROCEDURE spd_addmovimientos
    @id_cuenta INT,
    @saldo_ant DECIMAL(18,2),
    @saldo_post DECIMAL(18,2),
    @importe DECIMAL(18,2),
    @fecha_mov DATETIME
AS
BEGIN
    INSERT INTO movimientos (id_cuenta, saldo_ant, saldo_post, importe, fecha_mov)
    VALUES (@id_cuenta, @saldo_ant, @saldo_post, @importe, @fecha_mov);
END;
GO
-- Test
EXEC spd_addclientes 3, 'lopez', 'pedro', '25673333', '4355866', '1960-11-20';

-- 3. Procedimientos almacenados eliminatorios
-- a) Procedimiento para eliminar Clientes
CREATE PROCEDURE spd_delclientes
    @id_cliente INT
AS
BEGIN
    DELETE FROM clientes 
    WHERE id_cliente = @id_cliente;
END;
GO

-- b) Procedimiento para eliminar Cuentas
CREATE PROCEDURE spd_delcuentas
    @id_cuenta INT
AS
BEGIN
    DELETE FROM cuentas 
    WHERE id_cuenta = @id_cuenta;
END;
GO

-- c) Procedimiento para eliminar Movimientos
CREATE PROCEDURE spd_delmovimientos
    @id_movimiento INT
AS
BEGIN
    DELETE FROM movimientos 
    WHERE id_movimiento = @id_movimiento;
END;
GO

-- 4. Procedimientos almacenados actualizadores
-- a) Procedimiento para actualizar Clientes
CREATE PROCEDURE spd_upclientes
    @id_cliente INT,
    @apellido_cli NVARCHAR(100),
    @nombre_cli NVARCHAR(100),
    @dni NVARCHAR(20),
    @telefono NVARCHAR(50),
    @fecha_nac DATETIME
AS
BEGIN
    UPDATE clientes
    SET apellido_cli = @apellido_cli,
        nombre_cli = @nombre_cli,
        dni = @dni,
        telefono = @telefono,
        fecha_nac = @fecha_nac
    WHERE id_cliente = @id_cliente;
END;
GO

-- b) Procedimiento para actualizar Cuentas
CREATE PROCEDURE spd_upcuentas
    @id_cuenta INT,
    @id_cliente INT,
    @tipo_cuenta NVARCHAR(50),
    @saldo DECIMAL(18,2)
AS
BEGIN
    UPDATE cuentas
    SET id_cliente = @id_cliente,
        tipo_cuenta = @tipo_cuenta,
        saldo = @saldo
    WHERE id_cuenta = @id_cuenta;
END;
GO


-- c) Procedimiento para actualizar Movimientos
CREATE PROCEDURE spd_upmovimientos
    @id_movimiento INT,
    @id_cuenta INT,
    @saldo_ant DECIMAL(18,2),
    @saldo_post DECIMAL(18,2),
    @importe DECIMAL(18,2),
    @fecha_mov DATETIME
AS
BEGIN
    UPDATE movimientos
    SET id_cuenta = @id_cuenta,
        saldo_ant = @saldo_ant,
        saldo_post = @saldo_post,
        importe = @importe,
        fecha_mov = @fecha_mov
    WHERE id_movimiento = @id_movimiento;
END;
GO

-- 4) Procedimiento con parámetro de salida
CREATE PROCEDURE spu_ObtenerSaldoCuenta 
    @id_cuenta INT,
    @saldo DECIMAL(18,2) OUTPUT
AS
BEGIN
    SELECT @saldo = saldo
    FROM cuentas
    WHERE id_cuenta = @id_cuenta;
END;
GO
-- Test
DECLARE @saldo_actual DECIMAL(18,2);
EXEC spu_ObtenerSaldoCuenta 1, @saldo_actual OUTPUT;
PRINT @saldo_actual;
GO

-- 5) Procedimiento de salida de Movimientos
CREATE PROCEDURE spu_MovimientoCuenta 
    @fecha_movimiento DATETIME
AS
BEGIN
    SELECT 
        cli.apellido_cli,
        mov.id_movimiento, 
        mov.saldo_ant, 
        mov.saldo_post,
        mov.importe, 
        mov.fecha_mov
    FROM movimientos mov
    INNER JOIN cuentas cu ON mov.id_cuenta = cu.id_cuenta
    INNER JOIN clientes cli ON cu.id_cliente = cli.id_cliente
    WHERE mov.fecha_mov = @fecha_movimiento
    ORDER BY mov.fecha_mov DESC;
END;
GO
-- Test
EXEC spu_MovimientoCuenta '2008-05-02';
GO

-- 6) Procedimiento generar texto Clientes
CREATE PROCEDURE spe_GenerarTextoClientes
AS
BEGIN
    SELECT 
        c.apellido_cli + ' ' + 
        c.nombre_cli + ' ' + 
        c.dni + ' ' + 
        cu.tipo_cuenta + ' ' + 
        CAST(cu.saldo AS NVARCHAR(50)) AS LineaTXT
    FROM clientes c
    INNER JOIN cuentas cu ON c.id_cliente = cu.id_cliente;
END;
GO