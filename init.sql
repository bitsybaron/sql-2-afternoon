SELECT * FROM invoice i JOIN invoice_line il 
ON il.invoice_id = i.invoice_id
WHERE unit_price > 0.99;

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i JOIN customer c ON i.customer_id = c.customer_id;

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c JOIN employee e ON c.customer_id = e.customer_id;

SELECT al.title, ar.name
FROM album al JOIN artist ar ON al.artist_id = ar.artist_id;

SELECT pt.track_id FROM playlist p JOIN playlist_track pt 
ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music';

SELECT t.name FROM track t JOIN playlist_track pt 
ON t.track_id = pt.track_id
WHERE pt.playlist_id = 5;

SELECT t.name, p.name FROM
playlist p JOIN playlist_track pt 
ON p.playlist_id = pt.playlist_id
JOIN track t ON pt.track_id = t.track_id;

SELECT t.name, al.title 
FROM album al JOIN track t 
ON al.album_id = t.album_id 
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk';

SELECT * FROM invoice 
WHERE invoice_id 
IN (SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99);

SELECT * FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music');

SELECT name FROM track
WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);

SELECT * FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');

SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');

SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE artist_id IN (
    SELECT artist_id FROM artist WHERE name = 'Queen'
));

SELECT COUNT(*), g.name
FROM track t JOIN genre g
ON g.genre_id = t.genre_id
GROUP BY g.name;

SELECT COUNT(*), g.name
FROM track t JOIN genre g 
ON t.genre_id = g.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name;

SELECT COUNT(*), ar.name 
FROM artist ar JOIN album al 
ON ar.artist_id = al.artist_id
GROUP BY ar.name;

SELECT DISTINCT composer FROM track;

SELECT DISTINCT billing_postal_code FROM invoice;

SELECT DISTINCT company FROM customer;

DELETE FROM practice_delete WHERE type = 'bronze';

DELETE FROM practice_delete WHERE type = 'silver';

DELETE FROM practice_delete WHERE value = 150;

CREATE TABLE users 
(
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(15),
    email VARCHAR(30)
);

INSERT INTO users (name, email)
VALUES
('Lucy', 'lucy-anna@gmail.com'),
('Kivi', 'kivulinia@gmail.com'),
('Coconut', 'worlds-cutestkitten@gmail.com');

CREATE TABLE products
(
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(15),
    price INT
);

INSERT INTO products (name, price)
VALUES
('Poster', 4.99),
('Keychain', 3.99),
('Purse', 599.99);

CREATE TABLE orders 
(
    order_id SERIAL PRIMARY KEY,
    product_id INT
);
INSERT INTO orders (product_id)
VALUES 
(1),
(2),
(3);

SELECT * FROM orders o JOIN products p 
ON o.product_id = p.product_id 
WHERE o.order_id = 1;

SELECT * FROM orders o JOIN products p 
ON o.product_id = p.product_id;

SELECT SUM(p.price)
FROM orders o JOIN products p 
ON o.product_id = p.product_id;

