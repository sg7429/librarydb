CREATE TABLE readers (
    reader_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    address VARCHAR(50),
    date_of_birth DATE,
    PRIMARY KEY (reader_id)
);


CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    publication_year YEAR(4),
    genre ENUM('Fantasy', 'Romance', 'Science Fiction', 'Children\'s Books', 'History', 'Science', 'Self-Help', 'Mystery'),
    book_language VARCHAR(30),
    book_copies INT NOT NULL,
    PRIMARY KEY (book_id)
);


CREATE TABLE authors (
    author_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (author_id)
);




CREATE TABLE author_title (
    author_title_id INT NOT NULL AUTO_INCREMENT,
    author_id INT NOT NULL,
    book_id INT,
    PRIMARY KEY (author_title_id),
    FOREIGN KEY (author_id)
        REFERENCES authors (author_id),
    FOREIGN KEY (book_id)
        REFERENCES books (book_id)
);




CREATE TABLE loans (
    loan_id INT NOT NULL AUTO_INCREMENT,
    reader_id INT ,
    book_id INT ,
    date_borrowed DATE ,
    date_returned DATE,
    PRIMARY KEY (loan_id),
    FOREIGN KEY (reader_id)
        REFERENCES readers (reader_id),
    FOREIGN KEY (book_id)
        REFERENCES books (book_id)
);


CREATE TABLE book_requests (
    request_id INT NOT NULL AUTO_INCREMENT,
    reader_id INT,
    book_id INT,
    date_requested DATE,
    PRIMARY KEY (request_id),
    FOREIGN KEY (reader_id)
        REFERENCES readers (reader_id),
    FOREIGN KEY (book_id)
        REFERENCES books (book_id)
);

INSERT INTO readers(first_name, last_name, address, date_of_birth) 
VALUES 
	("Ana", "Petrova", "Sofia, Bulgaria", "1980-01-02"),
	("Ivan", "Petrov", "Sofia, Bulgaria", "1981-11-02"),
    ("Marina", "Ivanova", "Plovdiv, Bulgaria", "1956-11-17"),
    ("Bogdan", "Angelov", "Varna, Bulgaria", "1999-03-02"),
    ("Nikolina", "Nedyalkova", "Sofia, Bulgaria", "1945-07-22"),
    ("Petya", "Stoyanova", "Varna, Bulgaria", "2000-05-15"),
    ("Bozhidar", "Stoyanov", "Sofia, Bulgaria", "2005-11-30"),
    ("Iliyana", "Borisova", "Sofia, Bulgaria", "1993-08-02"),
    ("Boris", "Goranov", "Plovdiv, Bulgaria", "1995-01-23"),
    ("Anita", "Petrova", "Burgas, Bulgaria", "1948-11-25"),
    ("Nikoleta", "Daskalova", "Sofia, Bulgaria", "1962-09-08"),
    ("Radoslav", "Pavlov", "Ruse, Bulgaria", "1971-06-06"),
    ("Mariyana", "Dobreva", "Ruse, Bulgaria", "1943-11-08"),
    ("Milena", "Dancheva", "Sofia, Bulgaria", "1938-12-11"),
    ("Andrey", "Danchev", "Sofia, Bulgaria", "1983-12-10");


INSERT INTO books(title, publication_year, genre, book_language, book_copies)
VALUES
("Baker Of Fortune", '2015', "Science Fiction", "Bulgarian", 17),
("Owls And Robots", '1998', "Science Fiction", "English", 13),
("Descendants Of The Mountain", '1999', "Mystery", "English", 10),
("Turtles Of Utopia", '2005', "Fantasy", "Bulgarian", 12),
("Warrior Of History", '2015', "History", "Bulgarian", 20),
("Soldiers With Money", '2010', "Science Fiction", "Bulgarian", 14),
("Raven Of The Forest", '2013', "Children\'s Books", "Bulgarian", 15),
("Heirs And Enemies", '2008', "History", "English", 12),
("Knights And Men", '2001', "History", "English", 12),
("Sailing Into Technology", '2022', "Science", "English", 12),
("Promises Of The Beginning", '1983', "Science", "English", 12),
("Warrior Of Science", '2005', "Science", "German", 15),
("Dwelling In The Fog", '1973', "Self-Help", "German", 12),
("Will Without Time", '1961', "Self-Help", "German", 17),
("Visiting The Ships", '1905', "Self-Help", "German", 15),
("Controlling History", '2010', "Mystery", "Bulgarian", 19),
("Hope Of History", '1999', "Mystery", "Bulgarian", 11),
("Inspiration Of Dusk", '2000', "Mystery", "Bulgarian", 12)
;


INSERT INTO authors(first_name, last_name) 
VALUES
	("Ana", "Nedyalkova"),
	("Ivan", "Danchev"),
    ("Marina", "Dancheva"),
    ("Bogdan", "Goranov"),
    ("Nikolina", "Petrova"),
    ("Petya", "Dobreva"),
    ("Bozhidar", "Pavlov"),
    ("Iliyana", "Petrova"),
    ("Boris", "Angelov"),
    ("Anita", "Borisova"),
    ("Nikoleta", "Daskalova"),
    ("Radoslav", "Stoyanov"),
    ("Mariyana", "Stoyanova"),
    ("Milena", "Ivanova"),
    ("Andrey", "Petrov");


INSERT INTO author_title (author_id, book_id) 
VALUES 
(1,1), 
(1, 2),
(2, 3),
(3,3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10), 
(11, 11), 
(12, 12),
(13, 13), 
(14, 14), 
(15, 15),
(7, 16),
(8, 17), 
(8, 18), 
(3, 11),
(3, 12), 
(3, 13);


INSERT INTO loans(reader_id, book_id, date_borrowed, date_returned)
VALUES 
(8,11, '2023-06-03', '2023-08-07'),
(13,17, '2023-05-03', '2023-07-03'),
(8,6, '2023-03-11', '2023-04-13'),
(8,5, '2023-08-04', '2023-08-10'),
(5,11, '2023-08-20', '2023-09-20'),
(4,1, '2023-05-04', '2023-05-06'),
(1,5, '2020-01-19', '2023-03-24'),
(14,2, '2023-03-04', '2023-04-10'),
(5,10, '2023-03-06', '2023-06-12'),
(7,5, '2023-05-01', '2023-07-07'),
(9,5, '2023-02-20', '2023-04-20'),
(10,7, '2023-08-13', '2023-11-15'),
(12,3, '2023-08-20', '2023-11-24'),
(8,15, '2023-03-11', '2023-06-16'),
(7,17, '2023-02-07', '2023-04-09'),
(12,5, '2023-01-13', '2023-03-13'),
(9,14, '2023-05-16', '2023-05-22'),
(9,3, '2023-01-20', '2023-03-26'),
(7,2, '2023-04-09', '2023-05-14'),
(11,2, '2023-05-13', '2023-08-13'),
(2,5, '2023-06-10', '2023-09-16'),
(8,10, '2023-03-17', '2023-04-20'),
(13,13, '2023-03-06', '2023-06-10'),
(4,3, '2023-03-10', '2023-05-16'),
(15,13, '2023-03-08', '2023-05-09'),
(7,1, '2023-02-11', '2023-02-15'),
(3,6, '2023-03-07', '2023-03-11'),
(12,4, '2023-03-02', '2023-06-05'),
(6,3, '2023-02-21', '2023-04-24'),
(12,12, '2023-02-08', '2023-05-10'),
(9,17, '2023-07-12', '2023-010-16'),
(13,13, '2023-06-14', '2023-07-20'),
(5,12, '2023-04-16', '2023-04-22'),
(8,8, '2023-02-07', '2023-05-09'),
(3,1, '2023-01-13', '2023-04-13'),
(5,4, '2023-07-05', '2023-08-05'),
(13,1, '2023-01-02', '2023-04-02'),
(12,3, '2023-04-12', '2023-04-16'),
(14,17, '2023-04-03', '2023-04-05'),
(15,6, '2023-08-05', '2023-10-06'),
(14,3, '2023-01-11', '2023-02-15'),
(4,1, '2023-07-05', '2023-09-09'),
(11,2, '2023-05-06', '2023-06-10'),
(14,7, '2023-06-18', '2023-08-24'),
(3,6, '2023-03-08', '2023-03-13'),
(4,4, '2023-04-09', '2023-04-15'),
(14,4, '2023-01-11', '2023-01-17'),
(3,9, '2023-07-15', '2023-08-21'),
(12,17, '2023-03-09', '2023-03-09'),
(10,6, '2023-05-03', '2023-07-09'),
(15,10, '2023-05-10', '2023-08-12'),
(10,13, '2023-02-20', '2023-02-20'),
(4,14, '2023-06-06', '2023-08-10'),
(3,16, '2023-03-02', '2023-05-04'),
(6,17, '2023-03-13', '2023-06-19'),
(12,12, '2023-01-01', '2023-04-02'),
(4,18, '2023-06-14', '2023-07-15'),
(7,18, '2023-06-21', '2023-07-22'),
(4,15, '2023-05-14', '2023-07-18'),
(4,14, '2023-08-05', '2023-08-11'),
(14,12, '2023-03-05', '2023-05-06'),
(13,12, '2023-03-13', '2023-06-16'),
(8,5, '2023-02-20', '2023-04-24'),
(13,5, '2023-03-19', '2023-06-21'),
(8,18, '2023-06-16', '2023-06-18'),
(3,10, '2023-07-13', '2023-10-14'),
(7,17, '2023-03-14', '2023-04-18'),
(8,17, '2023-08-15', '2023-09-16'),
(12,17, '2023-01-01', '2023-02-01'),
(12,4, '2023-06-20', '2023-07-26'),
(8,4, '2023-02-10', '2023-05-13'),
(5,12, '2023-05-09', '2023-08-15'),
(7,11, '2023-05-12', '2023-08-13'),
(13,5, '2023-03-20', '2023-04-23'),
(13,11, '2023-01-15', '2023-04-19'),
(7,17, '2023-01-16', '2023-03-16'),
(3,17, '2023-01-09', '2023-03-09'),
(3,4, '2023-08-16', '2023-09-19'),
(8,14, '2023-06-03', '2023-07-03'),
(5,1, '2023-04-15', '2023-07-15'),
(10,13, '2023-07-16', '2023-09-18'),
(3,17, '2023-05-14', '2023-08-20'),
(4,18, '2023-04-16', '2023-06-16'),
(12,17, '2023-07-18', '2023-07-20'),
(7,9, '2023-06-18', '2023-07-20'),
(7,13, '2023-02-09', '2023-04-12'),
(12,3, '2023-06-01', '2023-08-05'),
(4,14, '2023-01-20', '2023-04-20'),
(11,7, '2023-03-02', '2023-04-02'),
(10,4, '2023-03-13', '2023-03-17'),
(4,9, '2023-02-08', '2023-03-12'),
(15,8, '2023-06-19', '2023-08-25'),
(3,5, '2023-04-13', '2023-06-16'),
(9,2, '2023-05-02', '2023-07-04'),
(12,9, '2023-03-21', '2023-05-24'),
(11,2, '2023-03-18', '2023-04-21'),
(15,16, '2023-05-17', '2023-08-21'),
(15,16, '2023-07-19', '2023-09-22'),
(13,3, '2023-01-22', '2023-01-25'),
(6,14, '2023-06-19', '2023-09-25');


INSERT INTO book_requests(reader_id, book_id, date_requested) 
VALUES
(3, 6, '2023-08-07'),
(7, 1, '2023-08-19'),
(11, 11, '2023-08-29'),
(7, 18, '2023-08-25'),
(8, 1, '2023-08-26'),
(10, 7, '2023-08-09'),
(12, 7, '2023-08-11'),
(14, 3, '2023-08-01'),
(6, 13, '2023-08-10'),
(3, 9, '2023-08-07'),
(12, 2, '2023-08-15'),
(4, 3, '2023-08-05'),
(10, 6, '2023-08-07'),
(8, 6, '2023-08-16'),
(6, 9, '2023-08-12');


-- get the top 3 readers for a specified year
DROP PROCEDURE IF EXISTS top_readers;
DELIMITER //
CREATE PROCEDURE top_readers (IN year_selected YEAR(4))
BEGIN
	SELECT 
		reader_id,
		CONCAT(first_name, ' ', last_name) AS reader,
		COUNT(reader_id) AS books_read
	FROM
		loans
			NATURAL JOIN
		readers
	WHERE YEAR(date_borrowed) = year_selected
	GROUP BY reader_id
	ORDER BY COUNT(reader_id) DESC
	LIMIT 3; 

END //
DELIMITER ;


-- get the top 3 authors for a specified year
DROP PROCEDURE IF EXISTS top_authors;
DELIMITER //
CREATE PROCEDURE top_authors (IN year_selected YEAR(4))
BEGIN
	SELECT 
	COUNT(loan_id), author_title.author_id, CONCAT(authors.first_name, ' ', authors.last_name) AS author
	FROM
		loans
			NATURAL JOIN
		readers
			NATURAL JOIN
		books
			NATURAL JOIN
		author_title
			INNER JOIN
		authors ON author_title.author_id = authors.author_id
	WHERE
		YEAR(date_borrowed) = year_selected
	GROUP BY author_title.author_id
	ORDER BY COUNT(loan_id) DESC
	LIMIT 3;

END //
DELIMITER ;


-- the 3 top genres for a specified year
DROP PROCEDURE IF EXISTS top_genres;
DELIMITER //
CREATE PROCEDURE top_genres (IN year_selected YEAR(4))
BEGIN
	SELECT 
		COUNT(genre), genre
	FROM
		loans
			NATURAL JOIN
		books
	WHERE
		YEAR(date_borrowed) = year_selected
	GROUP BY genre
	ORDER BY COUNT(genre) DESC
	LIMIT 3;


END //
DELIMITER ;


-- get the 3 most requested genres for the specified year
DROP PROCEDURE IF EXISTS genres_requested;
DELIMITER //
CREATE PROCEDURE genres_requested (IN year_selected YEAR(4))
BEGIN
	SELECT 
		COUNT(genre), genre
	FROM
		book_requests
			NATURAL JOIN
		books
	WHERE
		YEAR(date_requested) = year_selected
	GROUP BY genre
	ORDER BY COUNT(genre) DESC
	LIMIT 3;


END //
DELIMITER ;


--  get the most read title of the selected year along with author and genre
DROP PROCEDURE IF EXISTS best_book;
DELIMITER //
CREATE PROCEDURE best_book (IN year_selected YEAR(4))
BEGIN
	SELECT 
		title AS 'most read', genre,
		CONCAT(first_name, ' ', last_name) AS author
	FROM
		books
			NATURAL JOIN
		author_title
			NATURAL JOIN
		authors
	WHERE
		book_id = (SELECT 
				book_id
			FROM
				loans
			WHERE
				YEAR(date_borrowed) = year_selected
			GROUP BY book_id
			ORDER BY COUNT(book_id) DESC
			LIMIT 1);
END //
DELIMITER ;


--  get the most requested title of the selected year along with author and genre
DROP PROCEDURE IF EXISTS most_requested_title;
DELIMITER //
CREATE PROCEDURE most_requested_title (IN year_selected YEAR(4))
BEGIN
	SELECT 
		title AS 'most requested', genre,
		CONCAT(first_name, ' ', last_name) AS author
	FROM
		books
			NATURAL JOIN
		author_title
			NATURAL JOIN
		authors
	WHERE
		book_id = (SELECT 
				book_id
			FROM
				book_requests					
			WHERE
				YEAR(date_requested) = year_selected
			GROUP BY book_id
			ORDER BY COUNT(book_id) DESC
			LIMIT 1);
END //
DELIMITER ;



-- get the 3 most requested authors for a specified year
DROP PROCEDURE IF EXISTS most_requested_authors;
DELIMITER //
CREATE PROCEDURE most_requested_authors (IN year_selected YEAR(4))
BEGIN
	SELECT 
	COUNT(request_id) as requests, author_title.author_id, CONCAT(authors.first_name, ' ', authors.last_name) AS author
	FROM
		book_requests
			NATURAL JOIN
		readers
			NATURAL JOIN
		books
			NATURAL JOIN
		author_title
			INNER JOIN
		authors ON author_title.author_id = authors.author_id
	WHERE
		YEAR(date_requested) = year_selected
	GROUP BY author_title.author_id
	ORDER BY COUNT(request_id) DESC
	LIMIT 3;

END //
DELIMITER ;


-- check if a reader has already read a certain book
DROP PROCEDURE IF EXISTS has_read;
DELIMITER //
CREATE PROCEDURE has_read (IN r_id INT, IN book VARCHAR(30))
BEGIN
	SELECT 
    book_id, reader_id, date_borrowed, title
FROM
    loans
        NATURAL JOIN
    books
WHERE
    r_id = reader_id AND book = title;
END //
DELIMITER ;



-- look up a book using a keyword 
DROP PROCEDURE IF EXISTS find_book;
DELIMITER //
CREATE PROCEDURE find_book (IN book VARCHAR(30))
BEGIN
	SELECT 
    *
FROM
    books
WHERE
    title LIKE CONCAT('%', book, '%');
END //
DELIMITER ;


-- get all available books written by a specified author
DROP PROCEDURE IF EXISTS get_all_books;
DELIMITER //
CREATE PROCEDURE get_all_books (IN first_n VARCHAR(30), IN last_n VARCHAR(30))
BEGIN
	SELECT 
		CONCAT(first_name, ' ', last_name) AS author, title
	FROM
		books 
			INNER JOIN
		author_title ON books.book_id = author_title.book_id
			INNER JOIN
		authors ON author_title.author_id = authors.author_id
	WHERE
		first_name = first_n
		AND
		last_name = last_n; 
    
END //
DELIMITER ;