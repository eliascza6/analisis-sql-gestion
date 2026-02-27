SQL - LOGICAL OPERATORS

LIKE allows you to match similar values, instead of exact values.
IN allows you to specify a list of values you'd like to include.
BETWEEN allows you to select only rows within a certain range.
IS NULL allows you to select rows that contain no data in a given column.
AND allows you to select only rows that satisfy two conditions.
OR allows you to select rows that satisfy either of two conditions.
NOT allows you to select rows that do not match a certain condition.


The SQL LIKE operator

/*
Practice Problem
Write a query that returns all rows for which Ludacris was a member of the group.
*/

COMENTARIO DE ANÁLISIS DE NEGOCIO

/*
PROYECTO: 

*/

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%ludacris%'