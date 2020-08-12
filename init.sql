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
WHERE playlist_id IN (SELECT * FROM playlist WHERE name = 'Music');