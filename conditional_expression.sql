-- CASE
-- (sample db: dvdrental): lấy danh sách film, có thêm cột 'duration' với điều kiện length < 50 duration = short, ...
SELECT film_id, title, length,
	CASE 
		WHEN length < 50 THEN 'short'
		WHEN length >= 50 AND length < 120 THEN 'medium'
		WHEN length >= 120 THEN 'long'
	END duration 
FROM film


-- Phân loại film: economy, mass, premium
-- rental_rate = 0.99 => economy
-- rental_rate = 2.99 => mass
-- rental_rate = 4.99 => premium
-- ==> ĐẾM SỐ LƯỢNG FILM THUỘC TỪNG LOẠI TRÊN
SELECT 
    SUM(
        CASE
            WHEN rental_rate = 0.99 THEN 1 -- SUM = SUM + 1
            ELSE 0 -- SUM = SUM + 0
        END
    ) AS economy,
    SUM(
        CASE
            WHEN rental_rate = 2.99 THEN 1
            ELSE 0
        END
    ) AS mass,
    SUM(
        CASE
            WHEN rental_rate = 4.99 THEN 1
            ELSE 0
        END
    ) AS premium
FROM film


SELECT
	SUM(
		CASE rating
		WHEN 'NC-17' THEN 1
		ELSE 0
		END
	) "NC-17",
	
	SUM(
		CASE rating
		WHEN 'G' THEN 1
		ELSE 0
		END
	) G,
	
	SUM(
		CASE rating
		WHEN 'PG' THEN 1
		ELSE 0
		END
	) PG,
	
	SUM(
		CASE rating
		WHEN 'PG-13' THEN 1
		ELSE 0
		END
	) "PG-13"
	
FROM film


--COALESCE và NULLIF
--tạo bảng
CREATE TEMP TABLE posts (
  id serial primary key,
	title VARCHAR (255) NOT NULL,
	excerpt VARCHAR (150),
	body TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

INSERT INTO posts (title, excerpt, body)
VALUES
      ('test post 1','test post excerpt 1','test post body 1'),
      ('test post 2','','test post body 2'),
      ('test post 3', null ,'test post body 3');
	  
SELECT * FROM posts

-- Dùng COALESCE và NULLIF để set giá trị mặc định của excerpt, nếu null hoặc rỗng thì lấy 40 kí tự đầu của phần body
SELECT 
	posts.id,
	title,
	COALESCE(NULLIF(excerpt, ''), LEFT(body, 40)) excerpt -- nếu excerpt = '' -> tham số đầu tiên của COALESCE = null -> Lấy 40 kí tự đầu trường 'body'
FROM posts
