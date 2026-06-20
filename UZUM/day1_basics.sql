-- День 1. Основы SQL — данные ТАШ-110
-- Таблица: orders (607 строк, реальные заказы Uzum)

-- 1. Количество всех заказов
SELECT COUNT(*) FROM orders;

-- 2. Все заказы к выдаче
SELECT * FROM orders 
WHERE status = 'Готов к выдаче клиенту';

-- 3. Общая сумма выданных заказов
SELECT ROUND(SUM(amount), 2) AS summa
FROM orders 
WHERE status = 'Выдан';

-- 4. Топ-5 покупателей по количеству заказов
SELECT customer, COUNT(*) AS qty
FROM orders
GROUP BY customer
ORDER BY qty DESC
LIMIT 5;

-- 5. Количество заказов по статусам
SELECT status, COUNT(*) AS count
FROM orders
GROUP BY status;
