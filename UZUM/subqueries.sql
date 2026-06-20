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
