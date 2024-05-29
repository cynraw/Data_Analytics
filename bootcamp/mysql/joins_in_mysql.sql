SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_salary
;

-- Inner joins

SELECT *
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
;

-- To be more specific we can select the columns to be displayed after the joining
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Outer joins
-- Left outer and right outer.
-- Left join takes everything from the left table then only returns the matches from the right table..alter
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Right join dor=es the opposite of the left join 
-- Rows that are on the right table and not on the left table their values are given as null.alter
SELECT * 
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- self join
-- Tie the table to itself
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_id,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1= emp2.employee_id
;

-- Joining multiple tables together
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON 	dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS par
	ON sal.dept_id = par.department_id
;