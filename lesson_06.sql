-- STORE PROCEDURE: thu tuc luu tru

-- xoa thu tuc luu tru neu ton tai
DROP PROCEDURE IF EXISTS sp_01;

-- tao thu tuc luu tru lay phong ban theo id

DELIMITER $$
CREATE PROCEDURE sp_01 (IN in_department_id INT)
BEGIN
    SELECT *
    FROM department
    WHERE department_id = in_department_id;
END $$
DELIMITER ;
CALL sp_01 (5);


-- FUNCTION : ham 

-- xoa function neu ton tai
DROP FUNCTION IF EXISTS fn_01
DELIMITER $$
CREATE FUNCTION fn_01 (in_department_id INT) RETURNS VARCHAR(50)
BEGIN
     DECLARE v_department_name VARCHAR(50);
     SELECT department_name INTO v_department_name
     FROM department
     WHERE department_id = in_department_id;
     RETURN v_department_name;
END$$
DELIMITER ;
SET GLOBAL log_bin_trust_function_creators = 1;
SELECT  fn_01(1);


