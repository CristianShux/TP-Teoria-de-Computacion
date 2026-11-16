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

        -- Primero creamos la celda vacía para (i, j)
        INSERT INTO matriz_cyk (i, j, x) VALUES (v_i, v_j, ARRAY[]::text[]);

        -- Luego cruzamos todas las particiones k y actualizamos la celda existente
        UPDATE matriz_cyk m_update
        SET x = ARRAY(
            SELECT DISTINCT unnest(x || (
                SELECT COALESCE(array_agg(DISTINCT g.parte_izq), ARRAY[]::text[])
                FROM generate_series(v_i, v_j - 1) AS s(k)
                JOIN matriz_cyk m1 ON m1.i = v_i AND m1.j = s.k
                JOIN matriz_cyk m2 ON m2.i = s.k + 1 AND m2.j = v_j
                JOIN GLC_en_FNC g ON g.tipo_produccion = 2 AND g.parte_der1 = ANY (m1.x) AND g.parte_der2 = ANY (m2.x)
            ))
            ORDER BY 1
        )
        WHERE m_update.i = v_i AND m_update.j = v_j;

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