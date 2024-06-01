-- Temporary tables
-- Only visible to the session to which they are created in.
-- When you exit my sql and come back it not gonna be there.
-- Use case to store intermediate results for complex queries

-- First way to create a temp table
CREATE TEMPORARY TABLE temp_table
(
first_name varchar(50),
last_name varchar(50),
fav_movie varchar(100)
);
 
INSERT INTO temp_table
VALUES('Cynthia','Cheptanui','Euphoria');
 
SELECT *
FROM temp_table;

-- Second way to create a temp table

SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT * 
FROM salary_over_50k;
