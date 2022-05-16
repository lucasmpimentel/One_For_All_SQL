SELECT 
	COUNT(track_id) AS cancoes, COUNT(DISTINCT author) AS artistas, COUNT(DISTINCT album) AS albuns
FROM 
	SpotifyClone.tracks;
  