# Data_Analytics
I am a data analyst(Manifesting). or rather (On God).

Learning via Youtube (Alex the analyst free bootcamp series).

## skills to gained
 - SQL
 - Tableu
 - Power BI
 - Excel
 - Python
 - Cloud(AWS/Azure)

# Yeah Lets do this........ # Growth mindset
- Started by installing mysql and configuring it.
- Downloaded a file containing the data we will be using for the bootcamp.

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

## Unions in mySQL
- Allows you to combine rows together.
- Can be from same or separate tables.
- Syntax:
     - SELECT age, gender FROM employee_demographics UNION SELECT first_name, last_name FROM employee_salary;
- Union distinct Only selects the unique values in both table rows
- Union All selects all the rows in both tables even the duplicate
      
