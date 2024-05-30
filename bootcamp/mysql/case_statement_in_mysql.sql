-- Case statement
SELECT first_name, 
last_name, 
age,
CASE 
	WHEN age<=35 THEN 'Young'
    WHEN age BETWEEN 36 AND 50 THEN 'Old'
    WHEN age >= 51 THEN 'Very Old'
END AS Age_bracket
FROM employee_demographics;


-- Case study for pay increase
-- < 50000 = 5%
-- > 50000 = 7%
-- finance = 10%
SELECT 
CONCAT(first_name, ' ', last_name) AS name,
dept_id,
salary,
CASE 
    WHEN salary < 50000 THEN salary * 0.05 + salary
    WHEN salary > 50000 THEN salary * 0.07 + salary
END AS new_salary,
CASE
		WHEN dept_id=6 THEN 0.1 * salary 
END AS bonus
FROM employee_salary
;