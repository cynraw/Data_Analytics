-- WHERE statement
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1980-01-01'
OR gender= 'male'
;

SELECT * 
FROM employee_demographics
WHERE first_name = 'Leslie' AND age = 44 OR age > 55
;

-- LIKE statement
-- Special characters added to LIKE statement %, _
-- % means anything
-- _ means specific
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%'
;

SELECT * 
FROM employee_demographics
WHERE birth_date LIKE '1989%'
