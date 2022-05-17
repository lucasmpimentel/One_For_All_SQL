SELECT 
    t.track_name AS nome, COUNT(h.history_songs) AS reproducoes
FROM
    SpotifyClone.tracks AS t
    INNER JOIN SpotifyClone.history AS h ON h.history_songs = t.track_id
	INNER JOIN SpotifyClone.users AS u ON h.user_id = u.user_id
WHERE u.plan = 1 OR u.plan = 4
GROUP BY t.track_name