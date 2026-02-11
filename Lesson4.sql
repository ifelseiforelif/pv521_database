USE pv521;

GO

SELECT * FROM books;

GO 

DELETE FROM authors WHERE id=2;

GO



GO

INSERT INTO authors (id,name, surname)
VALUES 
(1, 'Тарас', 'Шевченко')

GO

SELECT * FROM authors;


GO

UPDATE authors SET id=7 WHERE id=6

GO

DROP TABLE books
DROP TABLE authors
GO

CREATE TABLE authors(
	id INT PRIMARY KEY IDENTITY(1,1),
	name nvarchar(30) NOT NULL,
	surname nvarchar(30) NOT NULL
)

INSERT INTO authors (id,name, surname)
VALUES 
(1,'Тарас', 'Шевченко'),
(2,'Іван', 'Франко'),
(3,'Леся', 'Українка'),
(4,'Михайло', 'Коцюбинський');

GO

CREATE TABLE books(
	id INT PRIMARY KEY IDENTITY(1,1),
	title nvarchar(30) NOT NULL,
	[year] int NOT NULL CHECK ([year]>=1800 AND [year]<=YEAR(GETDATE())),
	author_id int FOREIGN KEY REFERENCES authors(id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO books (title, [year], author_id)
VALUES
('Кобзар', 1840, 1),
('Гайдамаки', 1841, 1),
('Захар Беркут', 1883, 2),
('Мойсей', 1905, 2),
('Лісова пісня', 1911, 3),
('Intermezzo', 1908, 4);

UPDATE authors SET id=20 WHERE id=4;

DELETE FROM authors WHERE id=4


-- видалення та оновлення даних з  пов'язаних таблиць
-- можна робити у 4-ох режимах
-- ON DELETE (ON UPDATE) 
--1) NO ACTION
--2) SET NULL
--3) SET DEFAULT
--4) CASCADE

--Агрегуючи функції
-- SUM, COUNT, MIN, MAX, AVG
-- DISTINCT , TOP (LIMIT)

SELECT COUNT(*) AS total_count FROM books;
SELECT MAX(year) AS max_year FROM books;
SELECT MIN(year) AS min_year FROM books;
SELECT AVG(year) FROM books;
SELECT SUM(year) FROM books;

SELECT TOP 2 * FROM books ORDER BY id DESC;
--SELECT * FROM books LIMIT 2;


UPDATE books SET year=2000 WHERE id>=5;
SELECT DISTINCT year FROM books;
-- В таблицю books Додати поле price 
-- Тип поля decimal(10,2)  6767.99
-- Зробити виборку
-- 1) Назви книг без повторення
-- 2) Вивести перші 5 книг
-- 3) Вивести книгу з максимальною ціною
-- 4) Вивести середню ціну всіх книг, які видані після 1830 року


SELECT * FROM books;
SELECT * FROM authors;
--GROUP BY
-- авторів та скільки книжок кожен має
SELECT  * FROM books AS b
INNER JOIN authors AS a
ON a.id = b.author_id

SELECT  a.name, a.surname, COUNT(author_id) AS count_books FROM books AS b
INNER JOIN authors AS a
ON a.id = b.author_id
GROUP BY author_id, a.name, a.surname
HAVING a.name LIKE N'Тарас' OR a.name LIKE N'Леся'; 

SELECT year, COUNT(year) FROM books
GROUP BY year;

--Порахуйте сумарну вартість книжок
--для кожного автора
-- name surname sum

