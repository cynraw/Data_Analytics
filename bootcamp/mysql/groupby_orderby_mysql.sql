SELECT*
FROM employee_demographics
;

SELECT occupation, avg(salary)
FROM employee_salary
GROUP BY occupation
;

-- count() counts the number of rows in a given column.
SELECT gender, avg(age), max(age), min(age), count(age)
FROM employee_demographics
GROUP BY gender
;


-- ORDER BY statement
-- Sorts the resukts set in either assending or descending order
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC
; 








