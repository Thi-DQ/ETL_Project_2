-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "movies" (
    "id" serial   NOT NULL,
    "movie_id" varchar(10)   NOT NULL,
    "movies" varchar(100)   NOT NULL,
    "rank" int   NOT NULL,
    "movie_rating" float   NOT NULL,
    "rated_id" int   NOT NULL,
    "year" int   NOT NULL,
    "genre_id" int   NOT NULL,
    "actors" varchar(500)   NOT NULL,
    "director_id" int   NOT NULL,
    "gross" varchar(50)   NOT NULL,
    "last_updated" datetime   NOT NULL,
    CONSTRAINT "pk_movies" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "lk_genres" (
    "genre_id" serial   NOT NULL,
    "genre" varchar(50)   NOT NULL,
    "last_updated" datetime   NOT NULL,
    CONSTRAINT "pk_lk_genres" PRIMARY KEY (
        "genre_id"
     )
);

CREATE TABLE "lk_rated" (
    "rated_id" serial   NOT NULL,
    "rated" varchar(10)   NOT NULL,
    "last_updated" datetime   NOT NULL,
    CONSTRAINT "pk_lk_rated" PRIMARY KEY (
        "rated_id"
     )
);

CREATE TABLE "lk_directors" (
    "director_id" serial   NOT NULL,
    "director" varchar(500)   NOT NULL,
    "last_updated" datetime   NOT NULL,
    CONSTRAINT "pk_lk_directors" PRIMARY KEY (
        "director_id"
     )
);

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_rated_id" FOREIGN KEY("rated_id")
REFERENCES "lk_rated" ("rated_id");

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_genre_id" FOREIGN KEY("genre_id")
REFERENCES "lk_genres" ("genre_id");

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_director_id" FOREIGN KEY("director_id")
REFERENCES "lk_directors" ("director_id");

