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

-- Uzum ТАШ-110
-- Заказы выше средней суммы
SELECT customer, amount FROM orders 
  WHERE amount > (SELECT AVG(amount) FROM orders)

-- Заказы выше средней суммы по своему статусу (коррелированный подзапрос)
SELECT customer, amount FROM orders o 
  WHERE amount > (SELECT AVG(amount) FROM orders 
    WHERE status = o.status)

-- Напиши запрос который выводит средние суммы заказов по каждому статусу, но только те статусы где средняя сумма выше 50000.
SELECT status, avg_amount FROM 
  (SELECT status,  AVG(amount) as avg_amount FROM orders GROUP BY status) as sub  
    WHERE avg_amount > 50000

-- То же самое задача который сверху через HAVING 
SELECT status, AVG(amount) AS avg_amount FROM orders 
  GROUP BY status 
    HAVING AVG(amount) > 50000
