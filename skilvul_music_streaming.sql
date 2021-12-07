create DATABASE skilvulmusic;

use skilvulmusic;

CREATE TABLE user (
    user_id  int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    name     varchar(255) NOT NULL ,
    email    varchar(255) NOT NULL ,
    password varchar(255) NOT NULL ,
);

CREATE TABLE singer (
    singer_id int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    name      varchar(255) NOT NULL ,
);

CREATE TABLE album (
    album_id  int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    name      varchar(255) NOT NULL ,
    singer_id int NOT NULL ,
    CONSTRAINT FK_singer_id_album  FOREIGN KEY (singer_id)  REFERENCES singer (singer_id)
);

CREATE TABLE track (
    track_id  int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    title     varchar(255) NOT NULL ,
    singer_id int NOT NULL ,
    album_id  int NOT NULL ,
    CONSTRAINT FK_singer_id_track FOREIGN KEY (singer_id) REFERENCES singer (singer_id),
    CONSTRAINT FK_album_id_track FOREIGN KEY (album_id) REFERENCES album (album_id)
);

CREATE TABLE playlist (
    playlist_id int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    tracks      int NULL ,
    user_id     int NOT NULL ,
    CONSTRAINT FK_user_id_playlist FOREIGN KEY (user_id) REFERENCES user (user_id)
);

CREATE TABLE treack_playlist (
    id          int NOT NULL  AUTO_INCREMENT PRIMARY KEY ,
    track_id    int NOT NULL ,
    playlist_id int NOT NULL ,
    CONSTRAINT FK_treack_playlist FOREIGN KEY (track_id) REFERENCES track (track_id),
    CONSTRAINT FK_treack_playlist FOREIGN KEY (playlist_id) REFERENCES playlist (playlist_id)
);