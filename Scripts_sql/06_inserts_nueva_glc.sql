-- 06_inserts_nueva_glc.sql
-- Borrar la GLC de JSON anterior para que no acepte combinaciones híbridas inválidas

TRUNCATE TABLE GLC_en_FNC;

-- Gramática aritmética en FNC:
-- Reconoce enteros de 1 o más dígitos (0..9), operadores '+' y '*', y paréntesis '( )'
-- Símbolo inicial: E (Expresión)

-- Reglas binarias (tipo_produccion = 2)
-- E -> E X1 | T X2 | DIGITO NUM | PAR_A X3
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (true,  'E',      'E',      'X1',     2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (true,  'E',      'T',      'X2',     2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (true,  'E',      'DIGITO', 'NUM',    2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (true,  'E',      'PAR_A',  'X3',     2);

-- T -> T X2 | DIGITO NUM | PAR_A X3 (Término: maneja precedencia de '*')
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'T',      'T',      'X2',     2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'T',      'DIGITO', 'NUM',    2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'T',      'PAR_A',  'X3',     2);

-- F -> DIGITO NUM | PAR_A X3 (Factor: número o expresión entre paréntesis)
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'F',      'DIGITO', 'NUM',    2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'F',      'PAR_A',  'X3',     2);

-- Variables auxiliares para binarizar
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'X1',     'SUMA',   'T',      2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'X2',     'MULT',   'F',      2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'X3',     'E',      'PAR_C',  2);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'NUM',    'DIGITO', 'NUM',    2);

-- Reglas terminales (tipo_produccion = 1)
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'SUMA',   '+',      NULL,     1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'MULT',   '*',      NULL,     1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'PAR_A',  '(',      NULL,     1);
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion) VALUES (false, 'PAR_C',  ')',      NULL,     1);

-- Dígitos 0..9 (como E, T, F y NUM pueden derivar en un solo dígito tras eliminar unitarias)
INSERT INTO GLC_en_FNC (start, parte_izq, parte_der1, parte_der2, tipo_produccion)
SELECT false, v.izq, d.dig, NULL, 1
FROM (VALUES ('E'), ('T'), ('F'), ('NUM'), ('DIGITO')) AS v(izq)
CROSS JOIN (VALUES ('0'),('1'),('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9')) AS d(dig);

-- Pruebas de validación
SELECT 'Test 1 - Suma simple (1+1):' AS caso, cyk('1+1') AS resultado;
SELECT 'Test 2 - Suma encadenada (1+2+3):' AS caso, cyk('1+2+3') AS resultado;
SELECT 'Test 3 - Precedencia y paréntesis ((12+3)*4):' AS caso, cyk('(12+3)*4') AS resultado;
SELECT 'Test 4 - Inválido operador suelto (1+):' AS caso, cyk('1+') AS resultado;
SELECT 'Test 5 - Inválido paréntesis sin cerrar ((1+2)*3):' AS caso, cyk('(1+2)*3') AS resultado;