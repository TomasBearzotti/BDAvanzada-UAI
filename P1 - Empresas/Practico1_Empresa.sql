-- Create de las tablas

-- 1. Tabla de Ciudades
CREATE TABLE Ciudades (
    ID_Ciudad INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Ciudad NVARCHAR(60) NOT NULL UNIQUE
);

-- 2. Tabla de Proveedores
CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(60) NOT NULL,
    Telefono NVARCHAR(20),
    ID_Ciudad INT CONSTRAINT FK_Prov_Ciudad FOREIGN KEY REFERENCES Ciudades(ID_Ciudad)
);

-- 3. Tabla de Clientes
CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(60) NOT NULL,
    Telefono NVARCHAR(20),
    Dom_Ent_Calle NVARCHAR(60),
    Dom_Ent_Num INT,
    ID_Ciudad INT CONSTRAINT FK_Cli_Ciudad FOREIGN KEY REFERENCES Ciudades(ID_Ciudad)
);

-- 4. Tabla de Productos
CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY, -- Se suele asignar manualmente o usar IDENTITY
    Descripcion NVARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Peso DECIMAL(10,2),
    ID_Proveedor INT CONSTRAINT FK_Prod_Prov FOREIGN KEY REFERENCES Proveedores(ID_Proveedor)
);

-- 5. Tabla de Pedidos
CREATE TABLE Pedidos (
    ID_Pedido INT PRIMARY KEY IDENTITY(1,1),
    ID_Cliente INT CONSTRAINT FK_Ped_Cli FOREIGN KEY REFERENCES Clientes(ID_Cliente),
    Fecha DATE NOT NULL
);

-- 6. Tabla Intermedia
CREATE TABLE Pedidos_Productos (
    ID_Pedido INT CONSTRAINT FK_PP_Pedido FOREIGN KEY REFERENCES Pedidos(ID_Pedido),
    ID_Producto INT CONSTRAINT FK_PP_Prod FOREIGN KEY REFERENCES Productos(ID_Producto),
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    Precio_Unitario DECIMAL(10,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (ID_Pedido, ID_Producto)
);

-- Inserts

INSERT INTO Ciudades (Nombre_Ciudad) VALUES 
('Rosario'), 
('CABA'), 
('Córdoba'), 
('Mendoza'), 
('Salta');

INSERT INTO Proveedores (Nombre, Telefono, ID_Ciudad) VALUES 
('TechSupply S.A.', '3414555111', 1), 
('LogiCorp', '1142223333', 2),        
('Norte Distribuciones', '3874999888', 5), 
('Sur Industrial', '2614555444', 4);   

INSERT INTO Clientes (Nombre, Telefono, Dom_Ent_Calle, Dom_Ent_Num, ID_Ciudad) VALUES 
('Juan Perez', '3416123456', 'Av. Pellegrini', 1500, 1),
('Maria Gomez', '1149876543', 'Calle Falsa', 123, 2),
('Carlos Lopez', '3514111222', 'Av. Colon', 450, 3),
('Ana Rodriguez', '3415666777', 'Bv. Oroño', 2100, 1),
('Roberto Sanchez', '2614888999', 'San Martin', 10, 4);

INSERT INTO Productos (ID_Producto, Descripcion, Precio, Peso, ID_Proveedor) VALUES 
(8, 'Monitor 24" LED', 185000.00, 4.50, 1),
(11, 'Teclado Mecánico RGB', 45000.00, 1.20, 1),
(15, 'Mouse Gamer Orizon', 28000.00, 0.25, 2),
(22, 'Gabinete ATX Premium', 95000.00, 7.80, 3),
(30, 'Impresora Laser', 210000.00, 12.30, 4);

INSERT INTO Pedidos (ID_Cliente, Fecha) VALUES 
(1, '2026-05-01'),
(2, '2026-05-02'),
(3, '2026-05-03'),
(1, '2026-05-04'),
(4, '2026-05-05');

INSERT INTO Pedidos_Productos (ID_Pedido, ID_Producto, Cantidad, Precio_Unitario) VALUES 
(1, 8, 1, 185000.00), 
(1, 11, 2, 45000.00),  
(2, 15, 3, 28000.00),  
(3, 22, 1, 95000.00),  
(4, 11, 1, 45000.00),  
(5, 30, 1, 210000.00), 
(5, 15, 2, 28000.00);  