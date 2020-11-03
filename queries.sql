-- Join 3 bảng: lấy danh sách tên phim và danh mục của nó
SELECT F.film_id, F.title, C.name
FROM 
	film F
JOIN film_category FC
	ON F.film_id = FC.film_id
JOIN category C
	ON FC.category_id = C.category_id;