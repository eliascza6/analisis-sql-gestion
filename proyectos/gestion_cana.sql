-- PROYECTO: Sistema de Gestión de Cultivo de Caña de Azúcar
-- OBJETIVO: Administrar el estado de las parcelas y proyectar rendimientos.

-- 1. Creación de la tabla de Parcelas
CREATE TABLE parcelas (
    id_parcela VARCHAR(10) PRIMARY KEY,
    nombre_campo VARCHAR(50),
    hectareas DECIMAL(10,2),
    estado VARCHAR(20), -- Establecimiento, Maduración, Cosecha/Resoca
    fecha_siembra DATE
);

-- 2. Insertar datos iniciales (Basados en tu Excel de Córdoba)
INSERT INTO parcelas (id_parcela, nombre_campo, hectareas, estado, fecha_siembra)
VALUES 
('A-1', 'Lote El Refugio', 5.5, 'Cosecha/Resoca', '2024-03-15'),
('A-2', 'La Gloria', 3.2, 'Maduración', '2024-05-20'),
('A-4', 'Nueva Siembra', 2.0, 'Establecimiento', '2025-11-01'),
('A-5', 'Ampliación Sector Sur', 4.5, 'Establecimiento', '2025-12-10');

-- 3. CONSULTA DE BI: ¿Cuántas hectáreas tenemos por cada estado de cultivo?
-- Esta consulta es vital para tu Dashboard de gestión.
SELECT estado, SUM(hectareas) AS total_hectareas
FROM parcelas
GROUP BY estado;

-- 4. CONSULTA DE FILTRO: Ver solo parcelas que no darán ingreso este ciclo (Establecimiento)
SELECT id_parcela, nombre_campo, hectareas
FROM parcelas
WHERE estado = 'Establecimiento';
