-- thêm 1 dòng dữ liệu gồm 2 giá trị url và name vào bảng links, trả về id và name của dòng dữ liệu đó khi đã insert thành công
INSERT INTO links (url, name)
VALUES('https://www.tutorials.com','Tutorials')
RETURNING id, name;