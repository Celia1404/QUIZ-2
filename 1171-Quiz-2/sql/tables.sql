--CREATE TABLE OF FILE NAME tables.sql 
DROP TABLE IF EXISTS tracks CASCADE;
DROP TABLE IF EXISTS albums CASCADE;

--CREATE two tables for the music database 

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255)
);

CREATE TABLE tracks (
  id SERIAL PRIMARY KEY,
  album_id INTEGER REFERENCES albums(id),
  title VARCHAR(255),
  lenght INTEGER 
);


  ALTER TABLE tracks ADD CONSTRAINT tracks_albums_fk
  FOREIGN KEY (album_id)
  REFERENCES albums(id)
  ON DELETE CASCADE;

--INSERT in each table 
--INSERT INTO albums table 

INSERT INTO albums ( id, title) VALUES
  ( 01, 'Title'),
  ( 02, 'Fine Line'),
  ( 03, 'Abbey Road'),
  ( 04, 'Born This Way'),
  ( 05, 'The Fame'),
  ( 06, 'Honey'),
  ( 07, 'Thank Me Later'),
  ( 08, 'Hot Fuss'),
  ( 09, 'Five Easy Hot Dogs'),
  ( 10, 'The Jaws of Life');

INSERT INTO  tracks (id, album_id, title, lenght) VALUEs
  (01, 0001,'As Time Goes By', 5),
  (02, 0002,'As The World Turns', 2),
  (03, 0003,'But Not For Me', 3),
  (04, 0004,'Closer', 4),
  (05, 0005,'Disco Inferno', 2),
  (06, 0006,'Down By The River', 4),
  (07, 0007,'End Of The Road', 5),
  (08, 0008,'Five Minutes Of Funk', 4),
  (09, 0009,'Gimme All Your Lovin', 5),
  (10, 0010,'Heroes', 3);


-- QUARIES


SELECT albums.title AS album_title, tracks.title AS track_title, tracks.lenght
FROM albums
INNER JOIN tracks ON albums.id = tracks.album_id
ORDER BY albums.title, tracks.title;

SELECT albums.title, COUNT(tracks.id) AS num_songs
FROM albums
LEFT JOIN tracks ON albums.id = tracks.album_id
GROUP BY albums.title;

SELECT COUNT(DISTINCT tracks.album_id) AS num_albums
FROM tracks
WHERE tracks.title = 'Track 1';

