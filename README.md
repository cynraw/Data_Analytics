# Data_Analytics
## skills to gained
 - SQL
 - Tableu
 - Power BI
 - Excel
 - Python
 - Cloud(AWS/Azure)

# Yeah Lets do this...   # Growth mindset
- Started by installing mysql and configuring it.
- Downloaded a file containing the data we will be using for the bootcamp.

# SQL
## SELECT statement in mysql
- Used to work with columns and select what columns you want to see in your output.
- You have to specify the database before querying the selected columns.
- You can specify by double clicking on the database on the left menu or you can use the syntax:
     - SELECT * FROM database_name.column_name;
- We can select all the columns or specific columns.
     - SELECT * -selects all the columns in the database
     - SELECT first_name -selects the column named first_name
     - SELECT first_name,last_name,dob -selects all those columns mentioned
- N/B: Any math within mysql follows the rules of PEMDAS- this is the order of operations within mysql.
- Stands for Parenthesis, Exponent, Multiplication, Division, Addition, Subtraction.
- DISTINCT - selects only the unique values ie in a gender column it will return make and female. (Like to reduce redundancy).
- Syntax:
     - SELECT DISTINCT gender
## WHERE statement in mysql
- Used to filter rows of data in records.
- Only returns the row that fulfil a certain condition.
- Syntax:
     - SELECT * FROM employee_salary WHERE first_name = 'Leslie';

## LIKE statement
- Special characters added to LIKE statement %,
- % means anything
- _ means specific
- Syntax:
     - SELECT* FROM employee_demographics WHERE first_name LIKE 'A__%';
     - The statement implies that the filter should return a entity with the first name begining with A followed by two letters then anything comes after that.

 ## GROUP BY statement
 - Groups together rows that have the same values in the specified columns.
 - Once you group them together you can run an aggregate function of them.
 - For example when you want to find the average age for both genders this is the sql statements for that:
     - SELECT gender, avg(age) FROM employee_demographics GROUP BY gender;
     - This statement returns a table containing the genders and the average ages for both genders.
## LIMIT vs ALIASING
- specifies how many row you want in your output.
- Syntax:
     - SELECT * FROM employee_demographics LIMIT 3;
     - This returns the first 3 rows of the db.

 ## ORDER BY statement
 - Sorts the results set in either ascending or descending order.
 - syntax:
     - SELECT * FROM employee_demographics ORDER BY first_name ASC(or DSND);
     - Returns the first names in ascending order.

  ## Joins in mysql
- Allows you to combine two tables or more together if they have common columns.
- Not a must that the column names have to be same but the data in it should be atleast similar.
- joins could be:
     - Inner joins
     - outer joins
     - self joins
### Inner joins
- An INNER JOIN returns rows when there is a match in both tables.
- Returns rows that are the same in both columns from both tables.
- Used to combine two rows from two or more tables based on a related column between them.
  - syntax:
     - SELECT* FROM employee_demographics INNER JOIN employee_salary ON employee_demographics.employee_id = employee_salary.employee_id

### Outer joins
- An outer join in MySQL is used to combine rows from two or more tables based on a related column between them.
- Unlike inner joins, outer joins return all the rows from one table and the matched rows from the other table. If there is no match, the result is NULL on the side where there is no match.
- There are two types of outer joins:
         - Left Outer Join (or Left Join): Returns all rows from the left table, and the matched rows from the right table. If no match is found, the result is NULL from the right table.
         - Right Outer Join (or Right Join): Returns all rows from the right table, and the matched rows from the left table. If no match is found, the result is NULL from the left table.

### Self join
- A self join is a join in which a table is joined with itself.
- It is useful for comparing rows within the same table.
- This type of join is particularly important when you need to retrieve related data that exists in the same table, such as hierarchical data, comparing records, or finding duplicates.
      
### Cross joins
- A CROSS JOIN in SQL combines every row from one table with every row from another table, creating all possible pairs.
- This is useful when you want to ensure that every possible combination is considered, especially in scenarios like pairing students with subjects to track attendances or enrollments.
- A CROSS JOIN returns the Cartesian product of the two tables, i.e., all possible combinations of rows.
      
## Unions in mySQL
- Allows you to combine rows together.
- Can be from same or separate tables.
- Syntax:
     - SELECT age, gender FROM employee_demographics UNION SELECT first_name, last_name FROM employee_salary;
- Union distinct Only selects the unique values in both table rows
- Union All selects all the rows in both tables even the duplicate
      
## String Functions in mySQL
- Built in functions that help us work with strings.
### Length()
- Returns the length of a string.
- Syntax:
     - SELECT length('allstars') the value returned will  be 8.
 - Use case: Checking the length of a phone number.

### Upper() and lower()
- Changes the letters in a string to either lower case or upper case.
- Syntax:
     - SELECT UPPPER('sky');
     - SELECT LOWER('SKY');
 - Use case in standardization eg names to all upppercase.

### Trim()
- Gets rid of the whitespace either before or after a string.
- There are two types left trim and right trim.
- Syntax:
     - SELECT TRIM('       sky    ')
 
### Substring()
- Left(string,2) returns the first 2 letters of the string from the left.
- Substring(string, 2,3) returns a string that begins 2 letters from the initial string and goes 3 characters forward.
-  Syntax:
     - Substring(birth_date, 6, 2)

### Replace()
- Replaces a string character with another character you wish.
- Syntax:
     - SELECT first_name, REPLACE(first_name, 'a', 'z')
     - second parameter is the character you wish to replace and the third character is the character to replace.

### Locate()
- Returns a the position of a specific character in a string.
- Syntax:
     - SELECT LOCATE('a', 'Cynthia') Returns 7

### concat()
- Combines two columns together
- Syntax:
     - SELECT first_name, last_name,
     - CONCAT(first_name, ' ', last_name) AS full_name
     - FROM employee_demographics;
## Subquery in mysql
- Query within a query.
- Can be used in WHERE,SELECT AND FROM statements
- Subquery in where clause
     - SELECT *
     - FROM employee_demographics
     - WHERE employee_id IN
     - ( SELECT employee_id
     - FROM employee_salary
     - WHERE dept_id = 1);
- Subquery in the select statements
     - SELECT first_name, salary,
     - (SELECT AVG(salary)
     - FROM employee_salary)
     - FROM employee_salary;
- Subquery in the FROM statement
     - SELECT AVG(max_age)
     - FROM
     - (SELECT gender,
     - AVG(age) AS avg_age,
     - MAX(age) AS max_age,
     - MIN(age) AS min_age,
     - COUNT(age)
     - FROM employee_demographics
     - GROUP BY  gender) AS agg_table;

## Windows Functions in mysql
- Window functions perform calculations across a set of table rows that are somehow related to the current row.
- Useful for complex queries such as calculating running totals, moving averages, or ranking results.
- Rolling totals
- Adds the previous salary to the current till the order by is fulfilled
     - SELECT dem.first_name, dem.last_name, salary,
     - SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id)
     - FROM employee_demographics AS dem
     - JOIN employee_salary AS sal
     - ON dem.employee_id = sal.employee_id;
-  OVER(PARTITION BY gender ORDER BY dem.employee_id) this is the windows function that performs that operation of rolling sum on both genders.
-  ROW_NUMBER() Aggregate function that counts the number of rows and gives it a unique id.
     - SELECT dem.first_name, dem.last_name, salary,
     - ROW_NUMBER() OVER(PARTITION BY gender)
     - FROM employee_demographics AS dem
     - JOIN employee_salary AS sal
     - ON dem.employee_id = sal.employee_id;
- Gives id to the gender female from one to 4 and restarts for male 1-7
- RANK()assigns a rank to each row within the partition of a result set.
- The rank of a row is one plus the number of ranks that come before it. It can have duplicates

## CTEs(Common Table Expression) In mysql
- Allows you to define a sub query block that you can then reference within the main query.
- WITH - keyword to define CTE
- You can use the CTE only immediately after you have defined it.
-Example:
     - WITH CTE_example AS
     - (SELECT gender, AVG(salary) AS avg_sal, MAX(salary) AS max_sal,
     - MIN(salary) AS min_sal, COUNT(salary) AS count_sal
     - FROM employee_demographics AS dem
     - JOIN employee_salary AS sal
     - ON dem.employee_id = sal.employee_id
     - GROUP BY gender)
     - SELECT AVG(avg_sal)
     - FROM CTE_example;
- Instead of writing the column names as alias we can define the column names insde the parenthesis of the CTE name i.e: CTE_Example(Gender, AVG_sal, MAX_sal, MIN_sal, COUNT_sal)

## Temporary tables
- Only visible to the session to which they are created in.
- When you exit my sql and come back it not gonna be there.
- Use case to store intermediate results for complex queries
- Example:
     - CREATE TEMPORARY TABLE temp_table
     - (first_name varchar(50),
     - last_name varchar(50),
     - fav_movie varchar(50));
     - SELECT *
     - FROM temp_table;
- Second way to create a temp table
     - SELECT *
     - FROM employee_salary;
     - CREATE TEMPORARY TABLE salary_over_50k
     - SELECT *
     - FROM employee_salary
     - WHERE salary >= 50000;
     - SELECT *
     - FROM salary_over_50k;

## Stored Procedures in Mysql
- Way to store mysql code in a way that you can use it over and over again
- Enhances reusability of complex codes, and code that are used oftenly.
- Creating a procedure
- You can specify the database by using the keyword USE ie USE parks_recreation...
     - CREATE PROCEDURE large_salary()
     - SELECT *
     - FROM employee_salary
     - WHERE salary >= 50000;
     - CALL large_salary();
- We can separate queries in a storage procedure by using a delimeter.
- Using a delimeter
     - DELIMITER $$
     - CREATE PROCEDURE large_salary2()
     - BEGIN
     - SELECT *
     - FROM employee_salary
     - WHERE salary >= 50000;
     - SELECT *
     - FROM employee_salary
     - WHERE salary >= 10000
     - END $$
     - DELIMITER ;
     - CALL large_salary2()
- We can pass parameters to the name of the stored procedure which can later be used during calling the procedure.
- CREATE PROCEDURE large_salary3(p_employee_id INT)
- Later... CALL large_salary3(1)

## Triggers and events in mysql
- Triggers are procedures that automatically execute in response to certain events on a particular table, while events are scheduled actions that run at specified times.
- A trigger is a database object that is associated with a table and is activated by a certain event (e.g., INSERT, UPDATE, DELETE).
- Helps in automating some tasks.
- Event - What happens when it is scheduled.
- Example use case is creating an event that checks for employees over 60 and delete their data from the employees tables i.e retires them

## DATA CLEANING PROJECT IN MYSQL
- To get data in a more usable format to fix issues in the raw data so that you can easily use it to visualize the data.
- Steps:
     - Remove duplicates
     - Standardize data
     - Null values
     - Remove any unnecessary columns
 - Data Staging and Preparation.
 - To create a staging table:
 - CREATE TABLE layoffs_staging LIKE layoffs(Creates the columns similar to the one in layoffs)
 - To copy the data from layoffs to layoffs_staging INSERT layoffs_staging SELECT * FROM layoffs   
 - Data Staging: The layoffs_staging table serves as a staging area for data.
 - This allows you to manipulate, clean, and verify data without affecting the original layoffs table.
 - Schema Consistency: By creating a new table with the same structure as the layoffs table, you ensure that the data types and constraints are consistent, which helps maintain data integrity during the transfer process.
 - Data Backup: This step creates a backup of the current state of the layoffs table. This can be useful for recovery purposes or for historical comparisons.
 - Isolation of Changes: Any changes or updates can be applied to the layoffs_staging table first. This isolation helps in testing and verifying the impact of changes without risking data corruption or loss in the primary table.
   
#### Removing duplicates
- Stage the data and delete the duplicated rows
- To check duplicates you first have to have a uniquer identifiers of the columns ie row numbers
- To create a row number:
- SELECT *,
- ROW_NUMBER() OVER(PARTITION BY column names)AS row_num
- FROM layoffs_staging
- Since we cannot delete using a cte we have to create another staging table.

#### Standardization
- I.e Removing white spaces before the name of a rows entity
- SELECT company, trim(company)
- FROM layoffs_staging2
- The trim() function removes white spaces at the begining of a string.
- After altering a column you have to update the table.
- UPDATE layoffs_staging2
- SET company = trim(company)

#### Removing null values
- Not all null values can be removed only the ones that can be calculated cumulatively or populated.
- Remove columns that are not relevant going forward.
- Also remove row_num column as it is  no longer needed.
- ALTER TABLE layoffs_staging2
- DROP COLUMN row_num;


# EXCEL
## PivotTable
- PivotTable is a functionality in Excel which helps you organize and analyze data.
- It lets you add and remove values, perform calculations, and to filter and sort data sets.
- PivotTable helps you structure and organize data to understand large data sets.

