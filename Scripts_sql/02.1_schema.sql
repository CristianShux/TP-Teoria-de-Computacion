-- 02_inserts_prueba.sql
-- Gramática de prueba  simple para testear la lógica de setear_matriz()

TRUNCATE TABLE GLC_en_FNC;
TRUNCATE TABLE matriz_cyk;

-- S -> AB | BC
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (true, 'S', 'A', 'B', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (true, 'S', 'B', 'C', 2);

-- A -> BA | a
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'A', 'B', 'A', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'A', 'a', NULL, 1);

-- B -> CC | b
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'B', 'C', 'C', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'B', 'b', NULL, 1);

-- C -> AB | a
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'C', 'A', 'B', 2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'C', 'a', NULL, 1);