-- Kết hợp kết quả của các câu query cần GROUP BY các group sets khác nhau (CÁCH 1)
-- -- Lấy số lượng sản phẩm theo nhóm từng brand và segment, theo từng brand, theo từng segment và tổng sản phẩm thuộc tất cả brand và segment
SELECT --theo nhóm từng brand và segment
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment

UNION ALL

SELECT --theo từng brand
    brand,
    NULL,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand

UNION ALL

SELECT --theo từng segment
    NULL,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment

UNION ALL

SELECT --tổng sản phẩm thuộc tất cả brand và segment
    NULL,
    NULL,
    SUM (quantity)
FROM
    sales;


-- Kết hợp kết quả của các câu query cần GROUP BY các group sets khác nhau (CÁCH 2)
-- Lấy số lượng sản phẩm theo nhóm từng brand và segment, theo từng brand, theo từng segment và tổng sản phẩm thuộc tất cả brand và segment
SELECT 
    brand,
    segment,
    SUM(quantity)
FROM 
    sales
GROUP BY
    GROUPING SETS(
        (brand, segment),
        (brand),
        (segment),
        ()
    );



--SỬ DỤNG CUBE
SELECT 
    brand,
    segment,
    SUM(quantity)
FROM 
    sales
GROUP BY
    CUBE(brand, segment);


-- SỬ DỤNG ROOLUP: TÌM SỐ LẦN MƯỢN ĐĨA DVD THEO TỪNG NGÀY, TỪNG THÁNG, VÀ TỪNG NĂM (SAMPLE DATABASE: DVDRENTAL)
SELECT
    EXTRACT (YEAR FROM rental_date) y,
    EXTRACT (MONTH FROM rental_date) M,
    EXTRACT (DAY FROM rental_date) d,
    COUNT(rental_id) AS number_of_rental
FROM 
    rental
GROUP BY
    ROLLUP(
        EXTRACT (YEAR FROM rental_date),
        EXTRACT (MONTH FROM rental_date),
        EXTRACT (DAY FROM rental_date)
    );
