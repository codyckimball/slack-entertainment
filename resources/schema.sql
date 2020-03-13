CREATE TABLE public.user
( user_id SERIAL PRIMARY KEY,
 slack_handle TEXT NOT NULL UNIQUE,
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