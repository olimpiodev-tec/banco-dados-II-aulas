-- 1.0 Verifica o intervalo de datas das vendas

SELECT
    min(venda_data_criacao) data_inicio,
    max(venda_data_criacao) data_fim
FROM vendas;

-- 2.0 Faturamento por dia
SELECT
    DATE(venda_data_criacao) data,
    SUM(venda_total) faturamento
FROM 
    vendas
WHERE 
    venda_data_criacao::date = '2025-01-02'
GROUP BY
    DATE(venda_data_criacao)
ORDER BY
    data;

-- 3.0 Faturamento por período
SELECT
    DATE(venda_data_criacao) data,
    SUM(venda_total) faturamento
FROM
    vendas
WHERE
    venda_data_criacao BETWEEN '2025-01-02' AND '2025-05-05'
GROUP BY
    (venda_data_criacao)
ORDER BY
    data;

-- 4.0 Faturamento por período, mostrando o dia da semana
SELECT
    to_char(DATE(venda_data_criacao), 'TMDay') dia_semana,
    DATE(venda_data_criacao) data,
    SUM(venda_total) faturamento
FROM
    vendas
WHERE
    venda_data_criacao BETWEEN '2025-01-02' AND '2025-05-05'
GROUP BY
    (venda_data_criacao)
ORDER BY
    data;

-- 5.0 Top 5 produtos mais vendidos

SELECT
    p.produto_nome,
    SUM(iv.item_venda_quantidade) quantidade_vendida,
    SUM(iv.item_venda_total) total_vendido
FROM
    itens_vendas iv
JOIN 
    produtos p
ON 
    p.id = iv.item_venda_produto_id
GROUP BY p.produto_nome
ORDER BY quantidade_vendida DESC
LIMIT 5;

-- 6.0 Média de valor de venda por mesa
SELECT
    m.id mesa,
    COUNT(v.id) total_vendas,
    ROUND(AVG(v.venda_total), 2) media_valor
FROM
    vendas v
JOIN 
    mesas m ON v.venda_mesa_id = m.id
GROUP BY m.id
ORDER BY mesa;


-- 7.0 Horário de pico (vendas por hora)
SELECT
    EXTRACT(HOUR FROM venda_data_criacao) hora,
    COUNT(id) qtde_vendas,
    SUM(venda_total) faturamento
FROM
    vendas
GROUP BY
    EXTRACT(HOUR FROM venda_data_criacao)
ORDER BY qtde_vendas DESC;

-- 8.0 Ticket médio do restaurante

SELECT
    ROUND(AVG(v.venda_total), 2) ticket_medio_venda,
    ROUND(
        AVG(
            v.venda_total / (
                SELECT 
                    COUNT(*) 
                FROM 
                    itens_vendas
                WHERE
                    item_venda_venda_id = v.id
            )
        ), 2
    ) ticket_medio_item
FROM
    vendas v;
