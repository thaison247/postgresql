
-- THÊM MỘT NHÂN VIÊN VÀO BẢNG CUSTOMERS, NẾU CÓ NV TRÙNG TÊN (NHÂN VIÊN ĐÃ TỒN TẠI) THÌ APPEND EMAIL MỚI VÀO CỘT EMAIL CŨ CỦA NHÂN VIÊN ĐÓ
INSERT INTO customers (name, email)
VALUES('Microsoft','hotline@microsoft.com') 
ON CONFLICT (name) 
DO 
   UPDATE SET email = EXCLUDED.email || ';' || customers.email;