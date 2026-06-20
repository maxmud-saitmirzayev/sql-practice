-- Подзапросы — практика
-- SQLZoo: SELECT within SELECT

-- Задача 1: страны с населением больше России
SELECT name FROM world 
  WHERE population > (SELECT population FROM world WHERE name = 'Russia')

-- Задача 2: страны Европы с ВВП на душу выше Великобритании
SELECT name FROM world 
  WHERE continent = 'Europe' and gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

-- Задача 3: Перечислите названия и континенты стран , входящих в состав Аргентины или Австралии . Отсортируйте по названию страны.
SELECT name, continent FROM world 
  WHERE continent = 'South America' UNION SELECT name, continent FROM world  
    WHERE continent = 'Oceania' ORDER BY name

-- Задача 4: Какая страна имеет население больше, чем Великобритания, но меньше, чем Германия? Укажите название и численность населения.
SELECT name, population FROM world  
  WHERE population > (SELECT population FROM world  WHERE name = 'United Kingdom') 
    AND population < (SELECT population FROM world  WHERE name = 'Germany')

-- Задача 5: Укажите название и численность населения каждой страны Европы. Укажите численность населения в процентах от численности населения Германии.
WITH   pog as (SELECT population FROM world  WHERE name = 'Germany') 
  SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM pog), 0), '%') as Percentage FROM world 
    WHERE continent = 'Europe'

  -- Задача 6: Какие страны имеют ВВП больше, чем любая другая страна Европы? [Укажите только название .] (Для некоторых стран значения ВВП могут быть нулевыми)
SELECT name FROM world 
  WHERE gdp > (SELECT MAX(gdp) FROM world 
    WHERE continent = 'Europe')

-- Задача 7: Найдите самую большую страну (по площади) на каждом континенте, укажите континент , его название и площадь :
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
    HAVING AVG(amount) > 50000


