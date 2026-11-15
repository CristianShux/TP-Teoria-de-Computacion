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
    tipo_produccion smallint -- 1 indica Var -> terminal, 2 indica Var -> Var1Var2
 );

-- Crear la tabla matriz_cyk
CREATE TABLE matriz_cyk (
    i smallint,
    j smallint,
    x text[] --Este es un vector de tipo text para almacenar el conjunto de variables Xij
	);

-- 02 isnerts_gramatica.sql
-- Este script inserta las producciones de la gramática en la tabla GLC_en_FNC.

Truncate table GLC_en_FNC;

INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (true, 'JSON', 'LLAVE_A', 'X1', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (true, 'JSON', 'LLAVE_A', 'LLAVE_C', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CONTENIDO', 'PAR', 'X2', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CONTENIDO', 'CLAVE', 'X3', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'PARES', 'PAR', 'X2', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'PARES', 'CLAVE', 'X3', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'PAR', 'CLAVE', 'X3', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CLAVE', 'COM_DOBLE', 'X4', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', 'LLAVE_A', 'X1', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', 'LLAVE_A', 'LLAVE_C', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', 'DIGITO', 'NUMERO', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', 'COM_SIMPLE', 'X5', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', 'COM_SIMPLE', 'COM_SIMPLE', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'X1', 'CONTENIDO', 'LLAVE_C', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'X2', 'COMA', 'PARES', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'X3', 'DOS_PUNTOS', 'VALOR', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'X4', 'TEXTO_CLAVE', 'COM_DOBLE', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'X5', 'TEXTO_VALOR', 'COM_SIMPLE', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'LETRA', 'TEXTO_CLAVE', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'CARACTER', 'TEXTO_VALOR', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', 'DIGITO', 'NUMERO', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LLAVE_A', '{', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LLAVE_C', '}', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'COMA', ',', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DOS_PUNTOS', ':', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'COM_DOBLE', '"', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'COM_SIMPLE', '''', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', ' ', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', ' ', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', '0', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', '0', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DIGITO', '0', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', '1', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', '1', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DIGITO', '1', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', '2', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', '2', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DIGITO', '2', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', '3', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', '3', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DIGITO', '3', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', '4', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', '4', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DIGITO', '4', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', '5', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', '5', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DIGITO', '5', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', '6', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', '6', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DIGITO', '6', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', '7', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', '7', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DIGITO', '7', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', '8', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', '8', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DIGITO', '8', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'VALOR', '9', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUMERO', '9', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'DIGITO', '9', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'a', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'a', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'a', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'a', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'b', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'b', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'b', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'b', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'c', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'c', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'c', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'c', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'd', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'd', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'd', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'd', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'e', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'e', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'e', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'e', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'f', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'f', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'f', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'f', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'g', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'g', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'g', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'g', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'h', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'h', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'h', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'h', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'i', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'i', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'i', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'i', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'j', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'j', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'j', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'j', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'k', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'k', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'k', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'k', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'l', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'l', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'l', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'l', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'm', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'm', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'm', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'm', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'n', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'n', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'n', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'n', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'o', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'o', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'o', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'o', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'p', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'p', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'p', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'p', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'q', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'q', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'q', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'q', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'r', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'r', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'r', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'r', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 's', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 's', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 's', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 's', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 't', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 't', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 't', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 't', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'u', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'u', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'u', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'u', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'v', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'v', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'v', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'v', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'w', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'w', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'w', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'w', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'x', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'x', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'x', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'x', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'y', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'y', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'y', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'y', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'z', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'z', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'z', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'z', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'A', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'A', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'A', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'A', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'B', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'B', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'B', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'B', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'C', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'C', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'C', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'C', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'D', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'D', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'D', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'D', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'E', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'E', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'E', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'E', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'F', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'F', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'F', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'F', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'G', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'G', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'G', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'G', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'H', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'H', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'H', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'H', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'I', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'I', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'I', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'I', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'J', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'J', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'J', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'J', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'K', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'K', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'K', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'K', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'L', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'L', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'L', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'L', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'M', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'M', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'M', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'M', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'N', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'N', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'N', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'N', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'O', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'O', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'O', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'O', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'P', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'P', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'P', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'P', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'Q', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'Q', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'Q', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'Q', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'R', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'R', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'R', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'R', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'S', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'S', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'S', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'S', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'T', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'T', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'T', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'T', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'U', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'U', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'U', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'U', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'V', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'V', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'V', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'V', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'W', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'W', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'W', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'W', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'X', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'X', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'X', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'X', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'Y', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'Y', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'Y', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'Y', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_CLAVE', 'Z', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'TEXTO_VALOR', 'Z', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'CARACTER', 'Z', NULL, 1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'LETRA', 'Z', NULL, 1);

-- carga en matriz_cyk todos los Xij de un nivel.
CREATE OR REPLACE FUNCTION setear_matriz(fila int) RETURNS void AS $$
DECLARE
    n   int;
    v_i int;
    v_j int;
BEGIN
    SELECT count(*) INTO n FROM cadena_cyk;

    IF fila = 1 THEN
        -- Caso base: Xii = {A | A -> a_i es una produccion}
        INSERT INTO matriz_cyk (i, j, x)
        SELECT c.pos, c.pos, 
		COALESCE((SELECT array_agg(DISTINCT g.parte_izq ORDER BY g.parte_izq)
        FROM GLC_en_FNC g
        WHERE g.tipo_produccion = 1 AND g.parte_der1 = c.simbolo), ARRAY[]::text[])
        FROM cadena_cyk c;
    ELSE
        -- Caso inductivo: Xij = {A | A -> B C, B en Xik, C en X(k+1)j, i <= k < j}
        FOR v_i IN 1 .. (n - fila + 1) LOOP
            v_j := v_i + fila - 1;

            INSERT INTO matriz_cyk (i, j, x)
            SELECT v_i, v_j,
            COALESCE(array_agg(DISTINCT g.parte_izq ORDER BY g.parte_izq), ARRAY[]::text[])
            FROM generate_series(v_i, v_j - 1) AS s(k)
            JOIN matriz_cyk m1 ON m1.i = v_i AND m1.j = s.k
            JOIN matriz_cyk m2 ON m2.i = s.k + 1 AND m2.j = v_j
            JOIN GLC_en_FNC g  ON g.tipo_produccion = 2 AND g.parte_der1 = ANY (m1.x) AND g.parte_der2 = ANY (m2.x);
        END LOOP;
    END IF;
END;
$$ LANGUAGE plpgsql;


--guarda el string, llena la matriz nivel por nivel y devuelve true si el simbolo inicial esta en X1n.
CREATE OR REPLACE FUNCTION cyk(p_texto text) RETURNS boolean AS $$
DECLARE
    n         int;
    v_fila    int;
    resultado boolean;
BEGIN
    -- la cadena vacia no se acepta
    IF p_texto IS NULL OR length(p_texto) = 0 THEN
        RETURN false;
    END IF;

    -- Limpiar corridas anteriores y guardar el string, un caracter por fila
    DELETE FROM matriz_cyk;
    DELETE FROM cadena_cyk;
    INSERT INTO cadena_cyk (pos, simbolo)
    SELECT t.pos, substr(p_texto, t.pos, 1)
    FROM generate_series(1, length(p_texto)) AS t(pos);

    n := length(p_texto);

    -- Llenar la matriz triangular, primero los Xii, luego (Xi,i+1), ..., hasta N
    FOR v_fila IN 1 .. n LOOP
        PERFORM setear_matriz(v_fila);
    END LOOP;

    -- Aceptar si el simbolo inicial esta en X1n
    SELECT EXISTS (
        SELECT 1
        FROM matriz_cyk m
        WHERE m.i = 1 AND m.j = n 
		AND EXISTS (SELECT 1 FROM GLC_en_FNC g
        WHERE g.start AND g.parte_izq = ANY (m.x))) INTO resultado;

    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

