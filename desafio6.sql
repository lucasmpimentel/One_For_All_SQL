SELECT 
    ROUND(MIN(plan_value), 2) AS faturamento_minimo,
    MAX(plan_value) AS faturamento_maximo,
    ROUND(AVG(plan_value), 2) AS faturamento_medio,
    ROUND(SUM(plan_value), 2) AS faturamento_total
FROM
    SpotifyClone.plans AS p
    INNER JOIN SpotifyClone.users AS u ON u.plan = p.plan_id;
    