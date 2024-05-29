-- Having vs where
-- Having comes specifically after the group by
SELECT gender, avg(age)
FROM employee_demographics
GROUP BY gender
HAVING avg(age)> 40
;


SELECT occupation, avg(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING avg(salary)> 60000
;
