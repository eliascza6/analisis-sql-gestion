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

-- 5. Creación de la tabla de Cosechas (Entregas al Ingenio)
CREATE TABLE entregas_ingenio (
    id_entrega INTEGER PRIMARY KEY,
    id_parcela VARCHAR(10),
    fecha_entrega DATE,
    toneladas_brutas DECIMAL(10,2),
    toneladas_netas DECIMAL(10,2),
    FOREIGN KEY (id_parcela) REFERENCES parcelas(id_parcela)
);

-- 6. Registro de entregas hipotéticas (Zafra 2025)
INSERT INTO entregas_ingenio (id_entrega, id_parcela, fecha_entrega, toneladas_brutas, toneladas_netas)
VALUES 
(101, 'A-1', '2025-02-15', 45.50, 43.20),
(102, 'A-1', '2025-02-16', 38.00, 36.10),
(103, 'A-2', '2025-02-20', 50.20, 48.00);

-- 7. CONSULTA DE BI AVANZADA: Rendimiento por parcela (Uso de JOIN)
-- Esta consulta une ambas tablas para saber el nombre del campo y cuánto entregó.
SELECT p.nombre_campo, SUM(e.toneladas_netas) AS total_entregado
FROM parcelas p
JOIN entregas_ingenio e ON p.id_parcela = e.id_parcela
GROUP BY p.nombre_campo;
