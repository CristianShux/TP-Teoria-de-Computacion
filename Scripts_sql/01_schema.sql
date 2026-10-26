-- 01_schema.sql
-- Este script crea las tablas necesarias para iniciar la creación de la matriz CYK y la tabla de GLC en FNC.

--Eliminar las tablas si existen
DROP TABLE IF EXISTS GLC_en_FNC;
DROP TABLE IF EXISTS matriz_cyk;

-- Create the GLC_en_FNC table
CREATE TABLE GLC_en_FNC (
    start boolean,
    parte_izq text,
    parte_der1 text,
    parte_der2 text,
    tipo_produccion smallint, -- 1 indica Var -> terminal, 2 indica Var -> Var1Var2
);

-- Crear la tabla matriz_cyk
CREATE TABLE matriz_cyk (
    i smallint,
    j smallint,
    x text[] --Este es un vector de tipo text para almacenar el conjunto de variables Xij
);