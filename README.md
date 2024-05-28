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

 ## ORDER BY statement
 - Sorts the results set in either ascending or descending order.
 - syntax:
     - SELECT * FROM employee_demographics ORDER BY first_name ASC(or DSND);
     - Returns the first names in ascending order.
  
