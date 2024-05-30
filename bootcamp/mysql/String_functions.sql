-- String functions
-- length
SELECT LENGTH('allstars')
;

-- Checking the length of the first names of the employees
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2
;

-- Upper()
-- Changes the letters to uppercase
SELECT UPPER('sky');
-- Lower()
-- Changes the letters to lowercase
SELECT LOWER('SKU');

SELECT first_name, UPPER(first_name)
FROM employee_demographics
;

-- Trim()
-- Removes whitespace before or after a string 
-- Two types lest and right
SELECT TRIM('       Sky       ');
SELECT LTRIM('      sky       ');

-- Substring
-- Left(string,2) returns the first 2 letters of the string from the left.
-- Substring(string, 2,3) returns a string that begins two letters from the initial string and goes two characters forward.
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2) AS name_initial,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics
;

-- Replay()
-- Replaces a certain character with what you want.
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics
;

-- Locate()
-- Returns the position of a specific character in a string
SELECT LOCATE('a', 'Cynthia');

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics
;

-- concatenation()
-- Combine columns into a single column.alter
SELECT first_name, last_name,
CONCAT(first_name,' ', last_name) AS full_name
FROM employee_demographics
;
