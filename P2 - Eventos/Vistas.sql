-- Vista VW_Pedidos
CREATE VIEW VW_Predios AS
SELECT P.nombre_predio, C.nomnbre_ciudad, PA.nombre_pais
FROM FER_Predios P
JOIN ADM_Ciudades C ON P.id_ciudad = C.id_ciudad
JOIN ADM_Paises PA ON C.id_pais = PA.id_pais
WHERE P.nombre_predio LIKE 'L%';

-- Vista VW_Feriashoy
CREATE VIEW VW_Feriashoy AS
SELECT E.nombre AS nombre_feria, R.rubro, E.fecha_apertura, E.fecha_cierre
FROM FER_Expos E
JOIN FER_Rubros R ON E.id_rubro = R.id_rubro
WHERE E.fecha_apertura >= '2024-01-01' AND E.fecha_apertura <= GETDATE();

-- Vista VW_Predios2
CREATE VIEW VW_Predios2 AS
SELECT nombre_predio, id_ciudad, superficie
FROM FER_Predios;
GO
-- Insert Test
INSERT INTO VW_Predios2 (nombre_predio, id_ciudad, superficie)
VALUES ('Nuevo Predio Test', 1, 1500);