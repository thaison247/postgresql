-- I) CREATE TABLES
DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
   id INT GENERATED ALWAYS AS IDENTITY,
   first_name VARCHAR(40) NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE employee_audits (
   id INT GENERATED ALWAYS AS IDENTITY,
   employee_id INT NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   changed_on TIMESTAMP(6) NOT NULL
);

-- II) INSERT EMPLOYEES 
INSERT INTO employees(first_name, last_name)
VALUES 
    ('Nguyen', 'Son'), 
    ('John', 'Doe'), 
    ('Scarlet', 'Witch');


-- III) CREATE A TRIGGER TO LOG EVERY CHANGES ON EMPLOYEES LAST_NAME INTO EMPLOYEE_AUDITS TABLE

-- 1) CREATE TRIGGER FUNCTION
CREATE FUNCTION Log_last_name_changes()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	AS
$$
BEGIN
	IF NEW.last_name <> OLD.last_name THEN
		INSERT INTO employee_audits(employee_id, last_name, changed_on)
		VALUES (OLD.id, OLD.last_name, now());
	END IF;
	
	RETURN NEW;
END
$$;

-- 2) CREATE TRIGGER
CREATE TRIGGER last_name_changes
AFTER UPDATE
ON employees
FOR EACH ROW
    EXECUTE PROCEDURE Log_last_name_changes();

-- 3) TEST TRIGGER: update employee last_name
UPDATE employees
SET last_name = 'Wick'
WHERE last_name = 'Doe';

SELECT * FROM employees
SELECT * FROM employee_audits


















