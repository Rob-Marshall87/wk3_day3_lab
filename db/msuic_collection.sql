DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artist;

CREATE TABLE artist (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  titel VARCHAR(255),
  artist_id INT4 REFERENCES artist(id) ON DELETE CASCADE
);
