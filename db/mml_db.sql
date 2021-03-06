-- drop database if exists mml_DB;
-- create database mml_DB;
use mml_DB;


/************************/
/*         DROP         */
/************************/
DROP TABLE IF EXISTS PATCH_NOTES;
DROP TABLE IF EXISTS BUG_REPORT;
DROP TABLE IF EXISTS FAV_ARTIST;
DROP TABLE IF EXISTS FAV_ALBUM;
DROP TABLE IF EXISTS FAV_TRACK;
DROP TABLE IF EXISTS FAV_GENRE;
DROP TABLE IF EXISTS GENRE;
DROP TABLE IF EXISTS COMMENT_REPORT;
DROP TABLE IF EXISTS USER_COMMENT;
DROP TABLE IF EXISTS RATE_REPORT;
DROP TABLE IF EXISTS RATE;
DROP TABLE IF EXISTS ADDED_FRIEND;
DROP TABLE IF EXISTS BLOCKED_USER;
DROP TABLE IF EXISTS ADMINISTRATOR;
DROP TABLE IF EXISTS MODERATOR;
DROP TABLE IF EXISTS SPOTIFY_USER;


/************************/
/*       CREATE         */
/************************/

CREATE TABLE ADMINISTRATOR (
	admin_id MEDIUMINT NOT NULL AUTO_INCREMENT,
	email VARCHAR(100) UNIQUE NOT NULL ,
	nick VARCHAR(30) UNIQUE NOT NULL,
	passwd VARCHAR(50) NOT NULL,
	
	PRIMARY KEY(admin_id)
);

CREATE TABLE MODERATOR (
	mod_id MEDIUMINT NOT NULL AUTO_INCREMENT,
	email VARCHAR(100) UNIQUE NOT NULL,
	nick VARCHAR(30) UNIQUE NOT NULL,
	passwd VARCHAR(50) NOT NULL,
	
	PRIMARY KEY(mod_id)
);

CREATE TABLE PATCH_NOTES (
	id VARCHAR(25) NOT NULL,
	admin_id MEDIUMINT NOT NULL,
	date_time DATE NOT NULL,
	content VARCHAR(5000) NOT NULL,
	
	FOREIGN KEY(admin_id) REFERENCES ADMINISTRATOR(admin_id),
	PRIMARY KEY(id)
);

CREATE TABLE SPOTIFY_USER (
	id VARCHAR(22) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	playlist_id VARCHAR(22) UNIQUE NOT NULL,
	image VARCHAR(200),
	private_user BOOLEAN NOT NULL,

	PRIMARY KEY(id)
);

CREATE TABLE BUG_REPORT (
	id VARCHAR(25) NOT NULL,
	user_id VARCHAR(22) NOT NULL,
	admin_id MEDIUMINT NOT NULL,
	reason VARCHAR(200) NOT NULL,
	screenshot VARCHAR(200) NOT NULL,
	date_time DATE NOT NULL,
	solved BOOLEAN NOT NULL,
	
	FOREIGN KEY(user_id) REFERENCES SPOTIFY_USER(id),
	FOREIGN KEY(admin_id) REFERENCES ADMINISTRATOR(admin_id),
	PRIMARY KEY(id, user_id)
);

CREATE TABLE GENRE (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	
	PRIMARY KEY(id)
);

CREATE TABLE FAV_GENRE (
	id MEDIUMINT NOT NULL,
	user_id VARCHAR(22) NOT NULL,
	name VARCHAR(100) NOT NULL,
	date_time DATE NOT NULL,
	
	FOREIGN KEY(id) REFERENCES GENRE(id),
	FOREIGN KEY(user_id) REFERENCES SPOTIFY_USER(id),
	PRIMARY KEY(id, user_id)
);

CREATE TABLE FAV_ARTIST (
	id VARCHAR(22) NOT NULL,
	user_id VARCHAR(22) NOT NULL,
	name VARCHAR(100) NOT NULL,
	date_time DATE NOT NULL,
	
	FOREIGN KEY(user_id) REFERENCES SPOTIFY_USER(id),
	PRIMARY KEY(id, user_id)
);

CREATE TABLE FAV_ALBUM (
	id VARCHAR(22) NOT NULL,
	user_id VARCHAR(22) NOT NULL,
	name VARCHAR(150) NOT NULL,
	date_time DATE NOT NULL,
	
	FOREIGN KEY(user_id) REFERENCES SPOTIFY_USER(id),
	PRIMARY KEY(id, user_id)
);

CREATE TABLE FAV_TRACK (
	id VARCHAR(22) NOT NULL,
	user_id VARCHAR(22) NOT NULL,
	name VARCHAR(150) NOT NULL,
	date_time DATE NOT NULL,
	
	FOREIGN KEY(user_id) REFERENCES SPOTIFY_USER(id),
	PRIMARY KEY(id, user_id)
);

CREATE TABLE USER_COMMENT (
	id VARCHAR(25) NOT NULL,
	writter_id VARCHAR(22) NOT NULL,
	receiver_id VARCHAR(22) NOT NULL,
	date_time DATE NOT NULL,
	last_updated DATE NOT NULL,
	text VARCHAR(300) NOT NULL,
	
	FOREIGN KEY(writter_id) REFERENCES SPOTIFY_USER(id),
	FOREIGN KEY(receiver_id) REFERENCES SPOTIFY_USER(id),
	PRIMARY KEY(id)
);

CREATE TABLE COMMENT_REPORT (
	id VARCHAR(25) NOT NULL,
	comment_id VARCHAR(25) NOT NULL,
	reportedby_id VARCHAR(22) NOT NULL,
	mod_id MEDIUMINT NOT NULL,
	date_time DATE NOT NULL,
	reason VARCHAR(500) NOT NULL,
	solved BOOLEAN NOT NULL,
	
	FOREIGN KEY(comment_id) REFERENCES USER_COMMENT(id),
	FOREIGN KEY(reportedby_id) REFERENCES SPOTIFY_USER(id),
	FOREIGN KEY(mod_id) REFERENCES MODERATOR(mod_id),
	PRIMARY KEY(id, comment_id, reportedby_id)
);

CREATE TABLE RATE (
	id VARCHAR(25) NOT NULL,
	user_id VARCHAR(22) NOT NULL,
	target_id VARCHAR(22) NOT NULL,
	target_type ENUM('ALBUM', 'ARTIST', 'SONG') NOT NULL,
	date_time DATE NOT NULL,
	last_updated DATE NOT NULL,
	text VARCHAR(300) NOT NULL,
	rate ENUM('0', '0,5', '1', '1,5', '2', '2,5', '3', '3,5', '4', '4,5', '5') NOT NULL,
	
	FOREIGN KEY(user_id) REFERENCES SPOTIFY_USER(id),
	PRIMARY KEY(id)
);

CREATE TABLE RATE_REPORT (
	id VARCHAR(25) NOT NULL,
	rate_id VARCHAR(25) NOT NULL,
	reportedby_id VARCHAR(22) NOT NULL,
	mod_id MEDIUMINT NOT NULL,
	date_time DATE NOT NULL,
	reason VARCHAR(500) NOT NULL,
	solved BOOLEAN NOT NULL,
	
	FOREIGN KEY(rate_id) REFERENCES RATE(id),
	FOREIGN KEY(reportedby_id) REFERENCES SPOTIFY_USER(id),
	FOREIGN KEY(mod_id) REFERENCES MODERATOR(mod_id),
	PRIMARY KEY(id, rate_id, reportedby_id)
);

CREATE TABLE ADDED_FRIEND (
	usersent_id VARCHAR(22) NOT NULL,
	userrecieved_id VARCHAR(22) NOT NULL,
	date_time DATE NOT NULL,
	accepted BOOLEAN NOT NULL,
	
	FOREIGN KEY(usersent_id) REFERENCES SPOTIFY_USER(id),
	FOREIGN KEY(userrecieved_id) REFERENCES SPOTIFY_USER(id),
	PRIMARY KEY(usersent_id, userrecieved_id)
);

CREATE TABLE BLOCKED_USER (
	user_id VARCHAR(22) NOT NULL,
	user_blocked VARCHAR(22) NOT NULL,
	date_time DATE NOT NULL,
	
	FOREIGN KEY(user_id) REFERENCES SPOTIFY_USER(id),
	FOREIGN KEY(user_blocked) REFERENCES SPOTIFY_USER(id),
	PRIMARY KEY(user_id, user_blocked)
);











































