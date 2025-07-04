create database col;
use col;
CREATE TABLE students (id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(50),marks INT);
INSERT INTO students (name, marks) VALUES('John', 85),('Sara', 92),('Ali', 70);
DELIMITER //

CREATE PROCEDURE ShowTopStudents(IN min_marks INT)
BEGIN
    SELECT name, marks FROM students
    WHERE marks >= min_marks;
END //
DELIMITER ;

CALL ShowTopStudents(80);
DELIMITER //

CREATE FUNCTION AddBonus(marks INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN marks + 5;
END //

DELIMITER ;
SELECT name, marks, AddBonus(marks) AS updated_marks FROM students;

