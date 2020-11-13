-- CREATE VIEW
CREATE VIEW customer_master AS
    SELECT cu.customer_id AS id,
        cu.first_name || ' ' || cu.last_name AS name,
        a.address,
        a.postal_code AS "zip code",
        a.phone,
        city.city,
        country.country,
        CASE
            WHEN cu.activebool THEN 'active'
            ELSE ''
        END AS notes,
        cu.store_id AS sid,
    FROM customer cu
        INNER JOIN city USING (city_id)
        INNER JOIN country USING (country_id);
        INNER JOIN address a USING (address_id)


-- SELECT FROM VIEW
SELECT
	*
FROM
	customer_master;


-- CHANGE VIEW: add email column
CREATE VIEW customer_master AS
    SELECT 
        cu.customer_id AS id,
        cu.first_name || ' ' || cu.last_name AS name,
        a.address,
        a.postal_code AS "zip code",
        a.phone,
        city.city,
        country.country,
        CASE
            WHEN cu.activebool THEN 'active'
            ELSE ''
        END AS notes,
        cu.store_id AS sid,
        cu.email        -- add email here
    FROM customer cu
        INNER JOIN address a USING (address_id)
        INNER JOIN city USING (city_id)
        INNER JOIN country USING (country_id);


-- ALTER VIEW NAME
ALTER VIEW customer_master RENAME TO customer_info;

-- DROP VIEW
DROP VIEW IF EXISTS customer_master;

-- MATERIALIZED VIEW
CREATE MATERIALIZED VIEW 