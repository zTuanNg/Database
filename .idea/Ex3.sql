-- 1 
SELECT b.id AS id_book ,b.title AS book_title, c.id AS id_cate, c.name AS category
FROM book b INNER JOIN book_category bc 
ON b.id = bc.id_book 
INNER JOIN category c 
ON c.id = bc.id_category 
WHERE (c.name = 'Comedy' OR c.name = 'Drama')

-- 2 
SELECT b.id AS id_book , b.title AS book , a.full_name AS author , c.name AS category   
FROM book b INNER JOIN book_category bc 
ON b.id = bc.id_book 
INNER JOIN category c ON c.id = bc.id_category 
INNER JOIN book_author ba ON b.id = ba.id_book 
INNER JOIN author a ON ba.id_author = a.id 
WHERE year_of_publication BETWEEN 1800 AND 1900

-- 3 
SELECT p.name AS publisher , COUNT(b.id) AS book_numbers 
FROM book b RIGHT JOIN publisher p ON b.id_publisher = p.id 
GROUP BY p.id 
