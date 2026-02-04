--constraints
USE pv521;

GO

DROP TABLE students;

GO

--CREATE TABLE students
--(
--	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	name varchar(30) CHECK(name='JOHN' OR name='BOB') DEFAULT('JOHN') NOT NULL,
--	age int CHECK (age>10 AND age<=18) NOT NULL,
--	email varchar(30) UNIQUE,
--	login varchar(30) UNIQUE CHECK(LEN(login)>10)
--);

CREATE TABLE students
(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	name varchar(30) NOT NULL,
	login varchar(30) NOT NULL
);



GO

INSERT INTO students (name, login)
VALUES ('Bob', 'bob'), ('Bob2', 'bob'), ('Bob3', 'bob');

GO

SELECT * FROM students;

GO

ALTER TABLE students
ADD CONSTRAINT UN_students_login UNIQUE(login);

GO
DELETE FROM students WHERE id>1;


print(GETDATE())

--Створити БД book_store
--Створити таблицю books
--з атрибутами id, title, author, year
-- year не меньше 1800 року і не більше поточного року, рік за дефолтом 2020
-- title не меньше 5 символів не приймати title зі значення default
-- author повинен бути унікальним полем
--Заповнити 3 записи, вивести їх

