--List the films where the yr is 1962 [Show id, title] 
SELECT id, title
 FROM movie
 WHERE yr=1962

--Give year of 'Citizen Kane'.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

--List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year. 
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr DESC, id

--What id number does the actor 'Glenn Close' have? 
SELECT id
FROM actor
WHERE name = 'Glenn Close'

--What is the id of the film 'Casablanca' 
SELECT id 
FROM movie
WHERE title = 'Casablanca'

-- Obtain the cast list for 'Casablanca'.
-- what is a cast list?

-- Use movieid=11768, (or whatever value you got from the previous question) 

SELECT name FROM movie
 JOIN casting ON movie.id = movieid
  JOIN actor ON casting.actorid = actor.id
WHERE movie.title = 'Casablanca';

--Obtain the cast list for the film 'Alien' 
SELECT name FROM movie
 JOIN casting ON movie.id = movieid
  JOIN actor ON casting.actorid = actor.id
WHERE movie.title = 'Alien';

--List the films in which 'Harrison Ford' has appeared 
SELECT title FROM movie
 JOIN casting ON movie.id = movieid
  JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford';

--List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role] 
SELECT title FROM movie
 JOIN casting ON movie.id = movieid
  JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford' AND ord != 1;

--List the films together with the leading star for all 1962 films. 
SELECT title, name FROM movie
 JOIN casting ON movie.id = movieid
  JOIN actor ON casting.actorid = actor.id
WHERE yr = 1962 AND ord = 1

--Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies. 
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1

