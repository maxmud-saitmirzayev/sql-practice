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

-- Задача 8: Перечислите каждый континент и название страны, которая стоит первой в алфавитном порядке.
SELECT continent, name FROM world x 
  WHERE NOT EXISTS (SELECT name FROM world y 
    WHERE y.continent=x.continent and x.name > y.name)
