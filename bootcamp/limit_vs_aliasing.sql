-- Limit vs aliasing
-- Selects the given number of rows in a db.
-- Can be combined with order by to make it more powerful

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

-- Aliasing keyword AS
-- The keyword can be ignored though...
-- To change the name of a column
SELECT gender, avg(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;