-- Triggers and events
-- Triggers are procedures that automatically execute in response to certain events on a particular table, while events are scheduled actions that run at specified times.
-- Trigger happens when an event takes place.
SELECT*
FROM employee_salary;

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN 
	INSERT INTO employee_demographics(employee_id,first_name,last_name)
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES ('13', 'Cynthia', 'Cheptanui', 'Data analyst', '1000000', NULL);

-- EVENTS
-- Happens when it is scheduled
-- Helps in automation
-- Use case for deleting employees once they have attained a certain age
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%';
