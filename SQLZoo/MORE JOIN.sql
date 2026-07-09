-- SQLZoo: Subqueries
-- Completed: 2026-07-08
-- All 5 tasks passed ✓

-- 11. Rock Hudson's busiest years (more than 2 movies per year)
SELECT yr, COUNT(title) AS movies
FROM casting c
JOIN movie m ON m.id = c.movieid
JOIN actor a ON a.id = c.actorid
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- 12. Movie title and leading actress name for every film with Julie Andrews
SELECT title, name
FROM casting c
JOIN movie m ON c.movieid = m.id
JOIN actor a ON a.id = c.actorid
WHERE movieid IN (
    SELECT movieid FROM casting
    WHERE actorid = (SELECT id FROM actor WHERE name = 'Julie Andrews')
)
AND ord = 1;

-- 13. Actors (alphabetical) with at least 15 starring roles
SELECT name
FROM actor a
JOIN casting c ON a.id = c.actorid
WHERE ord = 1
GROUP BY name
HAVING COUNT(name) >= 15
ORDER BY name;

-- 14. Movies released in 1978, sorted by cast size (desc) then title
SELECT title, COUNT(actorid)
FROM movie
JOIN casting ON movieid = movie.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title ASC;

-- 15. List all people who've worked with Art Garfunkel
SELECT name
FROM casting c
JOIN actor a ON a.id = c.actorid
WHERE movieid IN (
    SELECT movieid FROM casting
    JOIN actor ON actorid = id
    WHERE name = 'Art Garfunkel'
)
AND name != 'Art Garfunkel';
