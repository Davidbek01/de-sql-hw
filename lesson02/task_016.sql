1. Выбрать все данные из таблицы customers
SELECT * FROM customers;

2. Выбрать все записи из таблицы customers, но только колонки "имя контакта" и "город"
SELECT
  contact_name,
  city
FROM customers;

3. Выбрать все записи из таблицы orders, но взять две колонки: идентификатор заказа и
колонку, значение в которой мы рассчитываем как разницу между датой отгрузки и датой
формирования заказа.
SELECT 
  order_id,
  shipped_date - order_date as diff_shipped_ordered_dt
FROM orders;

4. Выбрать все уникальные города в которых "зарегистрированы" заказчики
SELECT DISTINCT city
FROM customers 
WHERE city IS NOT NULL;
5. Выбрать все уникальные сочетания городов и стран в которых "зарегистрированы"
заказчики
SELECT DISTINCT
  city,
  country
FROM customers
WHERE city IS NOT NULL AND country

6. Посчитать кол-во заказчиков
SELECT COUNT(*)
FROM customers;
  
7. Посчитать кол-во уникальных стран в которых "зарегистрированы" заказчик
SELECT COUNT(DISTINCT country)
FROM customers
WHERE country IS NOT NULL;