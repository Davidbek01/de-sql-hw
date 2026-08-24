1. Вывести продукты количество которых в продаже меньше самого малого среднего количества продуктов в деталях заказов (группировка по product_id). Результирующая таблица должна иметь колонки product_name и units_in_stock.
SELECT p.product_name, p.units_in_stock
FROM products p
WHERE p.units_in_stock < (
    SELECT MIN(avg_quantity)
    FROM (
        SELECT AVG(od.quantity) AS avg_quantity
        FROM order_details od
        GROUP BY od.product_id
    ) AS subquery
);

2. Напишите запрос, который выводит общую сумму фрахтов заказов для компаний-заказчиков для заказов, стоимость фрахта которых больше или равна средней величине стоимости фрахта всех заказов, а также дата отгрузки заказа должна находится во второй половине июля 1996 года. Результирующая таблица должна иметь колонки customer_id и freight_sum, строки которой должны быть отсортированы по сумме фрахтов заказов.
SELECT customer_id, SUM(freight) AS freight_sum
FROM orders
WHERE freight >= (
        SELECT AVG(freight) 
        FROM orders
    )
  AND shipped_date >= '1996-07-16' 
  AND shipped_date <= '1996-07-31'
GROUP BY customer_id
ORDER BY freight_sum;

3. Напишите запрос, который выводит 3 заказа с наибольшей стоимостью, которые были созданы после 1 сентября 1997 года включительно и были доставлены в страны Южной Америки. Общая стоимость рассчитывается как сумма стоимости деталей заказа с учетом дисконта. Результирующая таблица должна иметь колонки customer_id, ship_country и order_price, строки которой должны быть отсортированы по стоимости заказа в обратном порядке.
SELECT o.customer_id, o.ship_country, 
       SUM(od.unit_price * od.quantity * (1 - od.discount)) AS order_price
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
WHERE o.order_date >= '1997-09-01'
  AND o.ship_country IN ('Argentina', 'Brazil', 'Venezuela')
GROUP BY o.order_id, o.customer_id, o.ship_country
ORDER BY order_price DESC
LIMIT 3;

4. Вывести все товары (уникальные названия продуктов), которых заказано ровно 10 единиц (конечно же, это можно решить и без подзапроса).
SELECT DISTINCT p.product_name
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(od.quantity) = 10;
