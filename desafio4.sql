SELECT 
    u.user_name AS usuario,
    IF(MAX(IF(YEAR(h.play_date_history) = 2021, 1, 0)) = 1,
        'Usuário ativo',
        'Usuário inativo') AS condicao_usuario
FROM
    SpotifyClone.users AS u
	INNER JOIN SpotifyClone.history AS h ON u.user_id = h.user_id
GROUP BY h.user_id
ORDER BY usuario;

