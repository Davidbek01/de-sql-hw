1. Создать таблицу teacher с полями teacher_id serial, first_name varchar, last_name varchar, birthday date, phone varchar, title varchar
CREATE TABLE teacher (
    teacher_id serial,
    first_name varchar,
    last_name varchar,
    birthday date,
    phone varchar,
    title varchar
);


2. Добавить в таблицу после создания колонку middle_name varchar
ALTER TABLE teacher
ADD COLUMN middle_name varchar;


3. Удалить колонку middle_name
ALTER TABLE teacher
DROP COLUMN middle_name;


4. Переименовать колонку birthday в birth_date
ALTER TABLE teacher
RENAME COLUMN birthday TO birth_date;


5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE teacher
ALTER COLUMN phone TYPE varchar(32);

6. Создать таблицу exam с полями exam_id serial, exam_name varchar(256), exam_date date
CREATE TABLE exam 
(
    exam_id serial,
    exam_name varchar(256),
    exam_date date
);


7. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO teacher (first_name, last_name, birth_date, phone, title) VALUES
('JAKI', 'Doe', '1980-01-15', '123-456-7890', 'Professor'),
('Jane', 'Smith', '1975-05-20', '987-654-3210', 'Associate Professor'),
('David', 'Johnson', '1990-09-10', '555-123-4567', 'Assistant Professor');


8. Посредством полной выборки убедиться, что данные были вставлены нормально и идентификаторы были сгенерированы с инкрементом
SELECT * FROM teacher;


9. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
DELETE FROM teacher;
ALTER SEQUENCE teacher_teacher_id_seq RESTART WITH 1;