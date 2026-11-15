--Query simple para mostrar la gramatica cargada
SELECT * FROM GLC_en_FNC ORDER BY parte_izq;

-- Query para mostrar la matriz CYK visualmente
SELECT 
    (m.j - m.i + 1) AS nivel,
    string_agg(
        'X(' || m.i || ',' || m.j || ')={' || array_to_string(m.x, ',') || '}', 
        ' | ' 
        ORDER BY m.i
    ) AS fila_matriz
FROM matriz_cyk m
GROUP BY (m.j - m.i + 1)
ORDER BY nivel DESC;


