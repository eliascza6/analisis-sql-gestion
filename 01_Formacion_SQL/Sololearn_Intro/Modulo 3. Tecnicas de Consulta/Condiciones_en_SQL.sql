-- INSTRUCCIÓN: Completa la consulta para extraer las canciones que no superen los 3 minutos

SELECT titles
FROM songs
WHERE length <= 3
