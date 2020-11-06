-- tạo bảng

DROP TABLE accounts IF EXISTS;

CREATE TABLE accounts (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    balance DEC(15,2) NOT NULL,
    PRIMARY KEY(id)
);

-- start a transaction
BEGIN;

-- insert a new row into the accounts table
INSERT INTO accounts(name,balance)
VALUES('Alice',10000);

-- insert a new row into the accounts table
INSERT INTO accounts(name, balance)
VALUES ('Groovie', 15000);

-- commit the change (or roll it back later)
COMMIT;


-- CHUYỂN 1000 TỪ TÀI KHOẢN CỦA ALICE QUA GROOVIE, SỬ DỤNG TRANSACTION
BEGIN;

-- TRỪ 1000 TỪ TK CỦA ALICE
UPDATE accounts
SET balance = balance - 1000
WHERE name = 'Alice';

-- CỘNG 1000 VÀO TK CỦA ALICE
UPDATE accounts
SET balance = balance + 1000
WHERE name = 'Groovie';

COMMIT;