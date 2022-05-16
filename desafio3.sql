SELECT 
    u.user_name AS usuario, COUNT(h.user_id) AS qtde_musicas_ouvidas, ROUND(SUM(t.duration_seconds / 60), 2) AS total_minutos
FROM
    SpotifyClone.users AS u
	INNER JOIN SpotifyClone.history AS h ON u.user_id = h.user_id
    INNER JOIN SpotifyClone.tracks AS t ON h.history_songs = t.track_id
GROUP BY h.user_id
ORDER BY usuario;
