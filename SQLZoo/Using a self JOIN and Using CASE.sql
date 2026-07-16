-- SQLZoo: Using a self JOIN
-- Completed: 2026-07-16
-- All 3 tasks passed ✓

-- 1. Services connecting stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = 115 AND b.stop = 137;

-- 2. Services connecting stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

-- 3. Stops reachable from 'Craiglockhart' by one LRT bus (including itself)
SELECT stopb.name, a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON (stopa.id = a.stop)
JOIN stops stopb ON (stopb.id = b.stop)
WHERE stopa.name = 'Craiglockhart' AND a.company = 'LRT';


-- SQLZoo: Using CASE
-- Completed: 2026-07-16
-- All 3 tasks passed ✓

-- 1. Show teacher name, 'Sci' if dept 1 or 2, else 'Art'
SELECT t.name,
  CASE
    WHEN dept IN (1,2) THEN 'Sci'
    ELSE 'Art'
  END
FROM teacher t;

-- 2. CASE default: 'Sci' if dept 1/2, 'Art' if dept 3, else 'None'
SELECT name,
  CASE
    WHEN dept IN (1,2) THEN 'Sci'
    WHEN dept = 3 THEN 'Art'
    ELSE 'None'
  END
FROM teacher;

-- Bonus (different SQLZoo task, kept for reference):
-- show name and phone digit-word for teachers with a specific phone number
SELECT name,
  CASE
    WHEN phone = 2752 THEN 'two'
    WHEN phone = 2753 THEN 'three'
    WHEN phone = 2754 THEN 'four'
  END AS digit
FROM teacher;
