-- SQLZoo: SUM and COUNT
-- Section 5 — Completed: 2026-06-29
-- All 8 tasks passed ✓

-- 1. Total world population
SELECT SUM(population)
FROM world;

-- 2. List all continents (distinct)
SELECT DISTINCT continent
FROM world;

-- 3. Total GDP of Africa
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

-- 4. Count countries with area >= 1,000,000 km²
SELECT COUNT(name) AS country_count
FROM world
WHERE area >= 1000000;

-- 5. Total population of Estonia, Latvia, Lithuania
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6. Continent name + number of countries per continent
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

-- 7. Continent name + number of countries with population >= 10 million
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

-- 8. Continents with total population >= 100 million
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;
