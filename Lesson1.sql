--створення БД
CREATE DATABASE pv521

GO
--видалення БД
DROP DATABASE pv521;

GO

USE pv521;

GO 
DROP TABLE students;

GO
--students (id name age)
CREATE TABLE students(
  id int identity(1,1) primary key not null,
  name varchar(30) not null,
  age int not null
);

GO
--Додавання даних
INSERT INTO students (name, age) 
VALUES ('Bob', 25),('Alex', 20),('Bogdan',30),('John',12),('Alice',25);

GO
UPDATE students SET name='Alexander' WHERE id=2;

GO
DELETE FROM students WHERE age!=20;

GO
--Виборка даних з таблиці students
SELECT name AS назва, age AS вік FROM students WHERE name LIKE 'A%' ;
--Додати ще 2 студента і зробити виборку

TRUNCATE TABLE students;

DELETE FROM students;
print(LEN('  hjg '))


--CRUD operation- 
-- C - Create (INSERT INTO)
-- R - Read   (SELECT)
-- U - Update (Update)
-- D - Delete (Delete)