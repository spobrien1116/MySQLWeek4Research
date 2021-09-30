DROP PROCEDURE sp_hire_date_after;
DELIMITER //
CREATE PROCEDURE sp_hire_date_after (IN date DATE)
BEGIN
	SELECT * FROM employees WHERE hire_date > date;
END //
DELIMITER ;
CALL sp_hire_date_after ('1993-01-01');

DROP PROCEDURE sp_gender_total;
DELIMITER //
CREATE PROCEDURE sp_gender_total (OUT totalGender INT)
BEGIN
	SELECT COUNT(gender) INTO totalGender FROM employees WHERE gender = 'F';
END //
DELIMITER ;
CALL sp_gender_total(@FemaleEmployees);
SELECT @FemaleEmployees AS "Female Employees";

DROP PROCEDURE sp_variableTotalGender;
DELIMITER //
CREATE PROCEDURE sp_variableTotalGender (INOUT totalGender INT, genderType CHAR(1))
BEGIN
	SELECT COUNT(gender) INTO totalGender FROM employees WHERE gender = genderType;
END //
DELIMITER ;
CALL sp_variableTotalGender(@TotalEmployees,'M');
SELECT @TotalEmployees AS "Total Employees of Gender Type: Male";