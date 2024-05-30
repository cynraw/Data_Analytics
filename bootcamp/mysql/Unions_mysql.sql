-- Union statement
SELECT age, gender
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary
;

-- Union distinct Only selects the unique values in both table rows
SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary
;

-- Union All selects all the rows in both tables even the duplicate
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;

-- Use case whereby we want to query people who receive high pay and are old
SELECT first_name, last_name, 'Old man' AS label  
FROM employee_demographics
WHERE age > 40 AND gender='male' 
UNION 
SELECT first_name, last_name, 'Old lady' AS label  
FROM employee_demographics
WHERE age > 40 AND gender='female'
UNION
SELECT first_name, last_name, 'Highly_paid' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;