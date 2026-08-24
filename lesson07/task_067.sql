1. Создать представление, которое выводит следующие колонки:
order_date, required_date, shipped_date, ship_postal_code, company_name, contact_name, phone, last_name, first_name, title из таблиц orders, customers и employees.
Сделать select к созданному представлению, выведя все записи, где order_date больше 1го января 1997 года.
CREATE VIEW order_details_view AS
SELECT o.order_date, o.required_date, o.shipped_date, o.ship_postal_code, c.company_name, c.contact_name, c.phone, e.last_name, e.first_name, e.title
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id


SELECT * FROM order_details_view
WHERE order_date > '1997-01-01';


2. Создать представление, которое выводит следующие колонки:
order_date, required_date, shipped_date, ship_postal_code, ship_country, company_name, contact_name, phone, last_name, first_name, title из таблиц orders, customers, employees.
Попробовать добавить к представлению (после его создания) колонки ship_country, postal_code и reports_to. Убедиться, что проихсodit  ошибка. Переименовать представление и создать новое уже с дополнительными колонками.
Сделать к нему запрос, выбрав все записи, отсортировав их по ship_county.
Удалить переименованное представление.
CREATE VIEW order_details_view AS
SELECT o.order_date, o.required_date, o.shipped_date, o.ship_postal_code, o.ship_country, c.company_name, c.contact_name, c.phone, e.last_name, e.first_name, e.title
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id

ALTER VIEW order_details_extended_view RENAME TO order_details_view_old;

CREATE VIEW order_details_extended_view AS
SELECT o.order_date, o.required_date, o.shipped_date, o.ship_postal_code, o.ship_country, c.company_name, c.contact_name, c.phone, e.last_name, e.first_name, e.title
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id

SELECT * FROM order_details_extended_view
ORDER BY ship_country;

DROP VIEW order_details_view_old;

3.  Создать представление "активных" (discontinued = 0) продуктов, содержащее все колонки. Представление должно быть защищено от вставки записей, в которых discontinued = 1.
Попробовать сделать вставку записи с полем discontinued = 1 - убедиться, что не проходит.
CREATE VIEW active_products_view AS
SELECT * FROM products
WHERE discontinued = 0;             
WITH CHECK OPTION;

INSERT INTO active_products_view (product_name, unit_price, discontinued)
VALUES ('New Product', 20.00, 1); -- This should fail
