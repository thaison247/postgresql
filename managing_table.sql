--create tables
CREATE TABLE IF NOT EXISTS account_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  grant_date TIMESTAMP,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (role_id)
      REFERENCES roles (role_id),
  FOREIGN KEY (user_id)
      REFERENCES accounts (user_id)
);


-- select into (sample db: dvdrental)
-- tạo bảng film_r với dữ liệu là các film xếp loại (rating) 'R' và thời gian mượn (retal_duration) là 5
SELECT title, description, rating, rental_duration
INTO TABLE film_r
FROM film
WHERE rating = 'R' AND rental_duration = 5


-- create table as (sample db: dvdrental)
-- Tạo bảng short_films chứa các film có length < 90, sử dụng CREATE TABLE AS
CREATE TABLE IF NOT EXISTS short_films 
AS
SELECT film_id, title, length
FROM film
WHERE length < 90;

select * from short_films

