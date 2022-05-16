DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(20) NOT NULL,
    plan_value DOUBLE NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.artists(
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.albums(
	album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(30) NOT NULL,
    author INT NOT NULL,
    release_year INT NOT NULL,
    FOREIGN KEY (author) REFERENCES artists (artist_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.tracks(
	track_id INT AUTO_INCREMENT PRIMARY KEY,
    track_name VARCHAR(100) NOT NULL,
    author INT NOT NULL,
    album INT NOT NULL,
    duration_seconds INT NOT NULL,
    FOREIGN KEY (album) REFERENCES albums (album_id),
    FOREIGN KEY (author) REFERENCES artists (artist_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.users(
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    plan INT NOT NULL,
    sign_date DATE NOT NULL,
    FOREIGN KEY (plan) REFERENCES plans (plan_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.follows(
	user_id INT NOT NULL,
    following_artist INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (following_artist) REFERENCES artists (artist_id),
    CONSTRAINT follow_id PRIMARY KEY(user_id, following_artist)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.history(
	history_songs INT NOT NULL,
	play_date_history DATETIME NOT NULL,
	user_id INT NOT NULL,
	FOREIGN KEY (history_songs) REFERENCES tracks (track_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
    CONSTRAINT history_id PRIMARY KEY(user_id, history_songs)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.plans (plan_name, plan_value)
VALUES
	('gratuito', 0.00),
	('familiar', 7.99),
	('universitário', 5.99),
	('pessoal', 6.99);

INSERT INTO SpotifyClone.artists (artist_name)
VALUES
	('Walter Phoenix'),
	('Peter Strong'),
	('Lance Day'),
    ('Freedie Shannon'),
    ('Tyler Isle'),
    ('Fog');
    
INSERT INTO SpotifyClone.albums (album_name, author, release_year)
VALUES
	('Envious', 1, 1990),
    ('Exuberant', 1, 1993),
    ('Hallowed Steam', 2, 1995),
    ('Incandescent', 3, 1998),
    ('Temporary Culture', 4, 2001),
    ('Library of liberty', 4, 2003),
    ('Chained Down', 5, 2007),
    ('Cabinet of fools', 5, 2012),
    ('No guarantees', 5, 2015),
    ('Apparatus', 6, 2015);

INSERT INTO SpotifyClone.tracks (track_name, author, album, duration_seconds)
VALUES
	("Soul For Us", 1, 1, 200),
    ("Reflections Of Magic", 1, 1, 163),
    ("Dance With Her Own", 1, 1, 116),
    ("Troubles Of My Inner Fire", 1, 2, 203),
    ("Time Fireworks", 1, 2, 152),
    ("Magic Circus", 2, 3, 105),
    ("Honey, So Do I", 2, 3, 207),
    ("Sweetie, Let's Go Wild", 2, 3, 139),
    ("She Knows", 2, 3, 244),
    ("Fantasy For Me", 3, 4, 100),
    ("Celebration Of More", 3, 4, 146),
    ("Rock His Everything", 3, 4, 223),
    ("Home Forever", 3, 4, 231),
    ("Diamond Power", 3, 4, 241),
    ("Let's Be Silly", 3, 4, 132),
    ("Thang Of Thunder", 4, 5, 240),
    ("Words Of Her Life", 4, 5, 185),
    ("Without My Streets", 4, 5, 176),
    ("Need Of The Evening", 4, 6, 190),
    ("History Of My Roses", 4, 6, 222),
    ("Without My Love", 4, 6, 111),
    ("Walking And Game", 4, 6, 123),
    ("Young And Father", 4, 6, 197),
    ("Finding My Traditions", 5, 7, 179),
    ("Walking And Man", 5, 7, 229),
    ("Hard And Time", 5, 7, 135),
    ("Honey, I'm A Lone Wolf", 5, 7, 150),
    ("She Thinks I Won't Stay Tonight", 5, 8, 166),
    ("He Heard You're Bad For Me", 5, 8, 154),
    ("He Hopes We Can't Stay", 5, 8, 210),
    ("I Know I Know", 5, 8, 117),
    ("He's Walking Away", 5, 9, 159),
    ("He's Trouble", 5, 9, 138),
	("I Heard I Want To Bo Alone", 5, 9, 120),
    ("I Ride Alone", 5, 9, 151),
    ("Honey", 6, 10, 79),
    ("You Cheated On Me", 6, 10, 95),
    ("Wouldn't It Be Nice", 6, 10, 213),
    ("Baby", 6, 10, 136),
    ("You Make Me Feel So..", 6, 10, 83);

INSERT INTO SpotifyClone.users (user_name, age, plan, sign_date)
VALUES
	('Thati', 23, 1, '2019-10-20'),
    ('Cintia', 35, 2, '2017-12-30'),
    ('Bill', 20, 3, '2019-06-05'),
    ('Roger', 45, 4, '2020-05-13'),
    ('Norman', 58, 4, '2017-02-17'),
    ('Patrick', 33, 2, '2017-01-06'),
    ('Vivian', 26, 3, '2018-01-05'),
    ('Carol', 19, 3, '2018-02-14'),
    ('Angelina', 42, 2, '2018-04-29'),
    ('Paul', 46, 2, '2017-01-17');

INSERT INTO SpotifyClone.follows (user_id, following_artist)
VALUES
	(1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 3),
    (6, 1),
    (7, 2),
    (7, 5),
    (8, 1),
    (8, 5),
    (9, 6),
    (9, 4),
    (9, 3),
    (10, 2),
    (10, 6);

INSERT INTO SpotifyClone.history (history_songs, play_date_history, user_id)
VALUES
	(36, '2020-02-28 10:45:55', 1),
	(25, '2020-05-02 5:30:35', 1),
	(23, '2020-03-06 11:22:33', 1),
	(14, '2020-08-05 8:05:17', 1),
	(15, '2020-09-14 16:32:22', 1),
	(34, '2020-01-02 7:40:33', 2),
	(24, '2020-05-16 6:16:22', 2),
	(21, '2020-10-09 12:27:48', 2),
	(39, '2020-09-21 13:14:46', 2),
	(7, '2020-11-13 16:55:13', 3),
	(3, '2020-12-05 18:38:30', 3),
	(26, '2020-07-30 10:00:00', 3),
	(2, '2021-08-15 17:10:10', 4),
	(35, '2021-07-10 15:20:30', 4),
	(27, '2021-01-09 1:44:33', 4),
	(7, '2020-07-03 19:33:28', 5),
	(12, '2017-02-24 21:14:22', 5),
	(14, '2020-08-06 15:23:43', 5),
	(1, '2020-11-10 13:52:27', 5),
	(38, '2019-02-07 20:33:48', 6),
	(29, '2017-01-24 0:31:17', 6),
	(30, '2017-10-12 12:35:20', 6),
	(22, '2018-05-29 14:56:41', 6),
	(5, '2018-05-09 22:30:49', 7),
	(4, '2020-07-27 12:52:58', 7),
	(11, '2018-01-16 18:40:43', 7),
	(39, '2018-03-21 16:56:40', 8),
	(40, '2020-10-18 13:38:05', 8),
	(32, '2019-05-25 8:14:03', 8),
	(33, '2021-08-15 21:37:09', 8),
	(16, '2021-05-24 17:23:45', 9),
	(17, '2018-12-07 22:48:52', 9),
	(8, '2021-03-14 6:14:26', 9),
	(9, '2020-04-01 3:36:00', 9),
	(20, '2017-02-06 8:21:34', 10),
	(21, '2017-12-04 5:33:43', 10),
	(12, '2017-07-27 5:24:49', 10),
	(13, '2017-12-25 1:03:57', 10);