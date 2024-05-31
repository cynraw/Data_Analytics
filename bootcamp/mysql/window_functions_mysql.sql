-- Group by statement
SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

-- Window function
SELECT dem.first_name, dem.last_name, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS dem 
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


-- Rolling totals
-- Adds the previous salary to the current till the order by is fulfilled
SELECT dem.first_name, dem.last_name, salary,  
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total
FROM employee_demographics AS dem 
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Row_number() 
-- Aggregate function that counts the number of rows and gives it a unique id.
SELECT dem.first_name, dem.last_name, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num
FROM employee_demographics AS dem 
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
    
-- RANK()assigns a rank to each row within the partition of a result set.
SELECT dem.first_name, dem.last_name, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS denserank_num
FROM employee_demographics AS dem 
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;