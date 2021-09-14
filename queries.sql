-- Join on rated_id to get all PG-13 rated movies and bring back rank, movie_id, movies, rated and movie_rating--
Select
	m.rank,
	m.movie_id,
	m.movies,
	r.rated,
	m.movie_rating
From
	movies m
join lk_rated r on r.rated_id = m.rated_id
where 
	r.rated = 'PG-13'
order by 
	m.movie_rating asc;
	
	
	
-- Joining all 3 tables: genre, director, rated to get the movie rank--
Select 
	g.genre,
	m.rank,
	m.movie_id,
	m.movies,
	r.rated,
	m.movie_rating,
	d.director
From
 movies m
join lk_rated r on r.rated_id = m.rated_id
join lk_directors d on d.director_id = m.director_id
join lk_genres g on g.genre_id = m.genre_id
order by 
	m.rank asc;
	
-- Part 1 - Join movies by director who've directed greater than 1 movies, order by average rating ascending--
Select
	d.director_id,
	d.director, 
	count(d.director) as num_movies, 
	avg (m.movie_rating) as avg_rating,
	avg (m.rank) as avg_rank
From
	movies m
join lk_directors d on d.director_id = m.director_id
group by 
	d.director, d.director_id
having
	count(d.director) > 1
order by
	avg_rating asc;
	
-- Part 2 - Joining movies by directors where director_id is 6 and 2--
Select
	*
From
	movies m
join lk_directors d on d.director_id = m.director_id
where
	m.director_id in (6,2);
	
-- Join movies director by director_id to find actor Shaquille O'Neal--
Select
	m.movie_id,
	m.movies,
	m.rank,
	m.movie_rating,
	m.actors,
	m.gross,
	d.director
From
	movies m
join lk_directors d on d.director_id = m.director_id
Where
	m.actors like '%Shaq%';

