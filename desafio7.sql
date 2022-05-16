SELECT 
    art.artist_name AS artista, alb.album_name AS album, COUNT(following_artist) AS seguidores
FROM
    SpotifyClone.artists AS art
    INNER JOIN SpotifyClone.albums AS alb ON alb.author = art.artist_id
    INNER JOIN SpotifyClone.follows AS f ON f.following_artist = art.artist_id
GROUP BY art.artist_name, alb.album_name
ORDER BY seguidores DESC;
    