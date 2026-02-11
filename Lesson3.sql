USE pv521;

GO

CREATE TABLE authors(
	id INT PRIMARY KEY IDENTITY(1,1),
	name nvarchar(30) NOT NULL,
	surname nvarchar(30) NOT NULL
)

GO

CREATE TABLE books(
	id INT PRIMARY KEY IDENTITY(1,1),
	title nvarchar(30) NOT NULL,
	[year] int NOT NULL CHECK ([year]>=1800 AND [year]<=YEAR(GETDATE())),
	author_id int FOREIGN KEY REFERENCES authors(id)
);

GO

INSERT INTO authors (name, surname)
VALUES 
('Тарас', 'Шевченко'),
('Іван', 'Франко'),
('Леся', 'Українка'),
('Михайло', 'Коцюбинський');

GO

INSERT INTO books (title, [year], author_id)
VALUES
('Кобзар', 1840, 1),
('Гайдамаки', 1841, 1),
('Захар Беркут', 1883, 2),
('Мойсей', 1905, 2),
('Лісова пісня', 1911, 3),
('Intermezzo', 1908, 4);

GO

SELECT * FROM authors;

SELECT * FROM books;

GO

SELECT b.id, b.title, b.year, a.name, a.surname 
FROM books AS b, authors AS a
WHERE b.author_id=a.id
ORDER BY b.year ASC;

GO

SELECT b.title, a.surname FROM books AS b
INNER JOIN authors AS a
ON b.author_id=a.id;

--Створити таблицю з жанрами
--Кожна книжка повинна бути прив'язана до якогось
--певного жанру
--Заповнити таблицю з жанрами і вивести таку виборку
-- книга автор жанр
