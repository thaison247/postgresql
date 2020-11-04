-- TẠO BẢNG
DROP TABLE IF EXISTS links;

CREATE TABLE links (
	id SERIAL PRIMARY KEY,
	url VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR (255),
        last_update DATE
);

--INSERT
-- thêm 1 dòng dữ liệu gồm 2 giá trị url và name vào bảng links, trả về id và name của dòng dữ liệu đó khi đã insert thành công
INSERT INTO links (url, name)
VALUES('https://www.tutorials.com','Tutorials')
RETURNING id, name;

-- thêm nhiều dòng dữ liệu
INSERT INTO links (url, name)
VALUES
    ('https://www.tutorials1.com','Tutorials1'),
    ('https://www.tutorials2.com','Tutorials2'),
    ('https://www.tutorials3.com','Tutorials3'),
    ('https://www.tutorials4.com','Tutorials4')
RETURNING id, name;

--UPDATE
-- UPDATE dòng có id = 4, trả về dòng dữ liệu đã được update
UPDATE links
SET 
	url = 'https://www.new-tutorials.com',
	name = 'new tutorials'
WHERE id = 4
RETURNING *;




-- DEMO DELETE JOIN
-- Tạo bảng contacts và blacklists
DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts(
   contact_id serial PRIMARY KEY,
   first_name varchar(50) NOT NULL,
   last_name varchar(50) NOT NULL,
   phone varchar(15) NOT NULL
);


DROP TABLE IF EXISTS blacklist;
CREATE TABLE blacklist(
    phone varchar(15) PRIMARY KEY
);


INSERT INTO contacts(first_name, last_name, phone)
VALUES ('John','Doe','(408)-523-9874'),
       ('Jane','Doe','(408)-511-9876'),
       ('Lily','Bush','(408)-124-9221');


INSERT INTO blacklist(phone)
VALUES ('(408)-523-9874'),
       ('(408)-511-9876');
	   
SELECT * FROM contacts;
SELECT * FROM blacklist;


-- xoá các contact mà sđt xuất hiện trong bảng blacklist (cách 1: sử dụng DELETE JOIN/ DELETE USING)
DELETE FROM contacts
USING blacklist
WHERE contacts.phone = blacklist.phone

-- xoá các contact mà sđt xuất hiện trong bảng blacklist (cách 2: sử dụng DELETE JOIN VỚI SUBQUERY)
DELETE FROM contacts
WHERE phone IN (
		SELECT phone
		FROM blacklist
)



