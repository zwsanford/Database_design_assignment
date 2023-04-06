DROP DATABASE IF EXISTS music_app;

CREATE DATABASE IF NOT EXISTS music_app;

USE music_app;

CREATE TABLE IF NOT EXISTS artist(
	artist_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(artist_id)
);

CREATE TABLE IF NOT EXISTS song(
	song_id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    artist_id INT NOT NULL,
    duration DATETIME,
    explicit BIT,
    link VARCHAR(255) NOT NULL,
    PRIMARY KEY(song_id),
    FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
);
CREATE TABLE IF NOT EXISTS genre(
	genre varchar(50) NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY(genre, song_id),
    FOREIGN KEY(song_id) REFERENCES song(song_id)
);

CREATE TABLE IF NOT EXISTS playlist(
	playlist_id INT NOT NULL,
	PRIMARY KEY(playlist_id)
);

CREATE TABLE IF NOT EXISTS orders(
	song_id INT NOT NULL,
    playlist_id INT NOT NULL,
    FOREIGN KEY(song_id) REFERENCES song(song_id),
    FOREIGN KEY(playlist_id) REFERENCES playlist(playlist_id)
);

CREATE TABLE IF NOT EXISTS user(
	user_id INT AUTO_INCREMENT NOT NULL,
	email VARCHAR(255) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	fav_song INT NOT NULL,
	playlist_id INT NOT NULL,
	PRIMARY KEY (user_id),
	FOREIGN KEY (fav_song) REFERENCES song(song_id),
	FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id)
);