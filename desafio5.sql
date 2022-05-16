SELECT DISTINCT
    (t.track_name) AS cancao, COUNT(h.history_songs) AS reproducoes
FROM
    SpotifyClone.tracks AS t
    INNER JOIN SpotifyClone.history AS h ON t.track_id = h.history_songs
GROUP BY t.track_name
ORDER BY reproducoes DESC
LIMIT 2;
