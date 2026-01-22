-- INSTRUCCIÓN: Completa para seleccionar los 10 productos más caros

SELECT *
FROM products
ORDER BY price DESC
LIMIT 10
