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

FROM 
    film