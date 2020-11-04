
-- Dùng subquery với IN: lấy tất cả film có ngày trả return_date nằm trong khoảng từ 2005-05-29 đến 2005-05-30
SELECT
	film_id,
	title
FROM    
	film
WHERE
	film_id IN (
        -- danh sách film_id bị tồn kho và có ngày trả return_date nằm trong khoảng từ 2005-05-29 đến 2005-05-30
		SELECT
			inventory.film_id
		FROM
			rental
		INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
		WHERE
			return_date BETWEEN '2005-05-29'
		AND '2005-05-30'
	);


-- Dùng subquery với EXIST: lấy danh sách khách hàng (customer) có lịch sử thanh toán (payment) sample database: dvdrental
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS (
		SELECT
			1
		FROM
			payment
		WHERE
			payment.customer_id = customer.customer_id
    );

-- Dùng subquery với ANY: lấy các film có thời lượng-length > max length của một film thuộc một category
SELECT title
FROM film
WHERE length >= ANY(
    SELECT MAX( length )
    FROM film
    INNER JOIN film_category USING(film_id)
    GROUP BY  category_id );
