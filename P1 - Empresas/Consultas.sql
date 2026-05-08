-- Consultas

-- 4. Localidades de proveedores (sin repetir)
SELECT DISTINCT c.Nombre_Ciudad 
FROM Proveedores p 
JOIN Ciudades c ON p.ID_Ciudad = c.ID_Ciudad;

-- 5. Proveedores ordenados por nombre
SELECT * FROM Proveedores ORDER BY Nombre ASC;

-- 6. ID y Peso de productos 8 y 11
SELECT ID_Producto, Peso FROM Productos WHERE ID_Producto IN (8, 11);

-- 7. Promedio de peso de todos los productos
SELECT AVG(Peso) AS Promedio_Peso FROM Productos;

-- 8. Clientes por ciudad
SELECT c.Nombre_Ciudad, COUNT(cl.ID_Cliente) AS Cant_Clientes 
FROM Ciudades c 
LEFT JOIN Clientes cl ON c.ID_Ciudad = cl.ID_Ciudad 
GROUP BY c.Nombre_Ciudad;

-- 9. Pedidos con dirección completa
SELECT p.ID_Pedido, p.Fecha, c.Dom_Ent_Calle, c.Dom_Ent_Num, ciu.Nombre_Ciudad 
FROM Pedidos p 
JOIN Clientes c ON p.ID_Cliente = c.ID_Cliente 
JOIN Ciudades ciu ON c.ID_Ciudad = ciu.ID_Ciudad;

-- 10. Nombre de proveedor afectado a cada pedido
SELECT DISTINCT pe.ID_Pedido, prov.Nombre AS Nombre_Proveedor 
FROM Pedidos_Productos pp 
JOIN Pedidos pe ON pp.ID_Pedido = pe.ID_Pedido 
JOIN Productos pr ON pp.ID_Producto = pr.ID_Producto 
JOIN Proveedores prov ON pr.ID_Proveedor = prov.ID_Proveedor;