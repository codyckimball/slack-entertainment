CREATE TABLE public.user
( user_id SERIAL PRIMARY KEY,
 slack_id TEXT NOT NULL UNIQUE,
 slack_handle TEXT NOT NULL,
 slack_name TEXT NOT NULL,
 created_on TIMESTAMP NOT NULL)

CREATE TABLE IF NOT EXISTS show
( imdb_id TEXT PRIMARY KEY,
 title TEXT NOT NULL,
 year INTEGER NOT NULL,
 release_date DATE,
 runtime INTEGER,
 genre TEXT[],
 director TEXT,
 written_by TEXT,
 synopsis TEXT,
 actors TEXT,
 awards TEXT,
 imdb_rating NUMERIC (3, 1),
 rotten_tomatoes_rating NUMERIC (3, 2),
 total_seasons TEXT,
 show_type TEXT )

CREATE TABLE IF NOT EXISTS rating
( rating_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES public.user(user_id) NOT NULL,
  imdb_id TEXT NOT NULL,
  rating INTEGER NOT NULL,
  comment TEXT )

  #INSERT INTO rating 
  #(user_id, imdb_id, rating, comment) VALUES ()

  SELECT AVG(rating) from rating 
  JOIN show
  ON rating.imdb_id = show.imdb_id
  WHERE show.title = "<some value>";

  SELECT s.title, r.rating, r.comment
  FROM show as s
  JOIN rating as r
  ON s.imdb_id = r.imdb_id
  JOIN user as u 
  ON r.user_id = u.user_id
  WHERE u.slack_id = "<some value>";

  SELECT s.title, AVG(r.rating) as avg from rating as r  
  JOIN show as s 
  ON rating.imdb_id = show.imdb_id
  WHERE s.show_type = "<some value>"
  GROUP BY s.title
  ORDER BY avg DESC limit 10;

  SELECT * from show WHERE title = "<some value>";

