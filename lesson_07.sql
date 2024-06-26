-- LOCAL VARLIABLE : bien cuc bo
-- pham vi su dung:  BEGIN END 
-- tu khoa: DECLARE
-- vd DECLARE id INT;
-- SESSION VARLIABLE : bien sesion 
-- pham vi su dung : trong session
-- tu khoa : SET
-- vd : 
SET @age = 18;
SELECT @age;
-- GLOBAL VARLIABLE :bien toan cuc
-- pham vi su dung : toan bo


-- tu khoa : SETGGER
-- thoi diem : BEFORE , AAFTER
-- su kien : INSERT, UPDATE, DELETE
-- tham chieu : OLD, NEW
 
 DROP TRIGGER IF EXISTS trigger_01;
 DELIMITER $$
 CREATE TRIGGER trigger_01
 BEFORE INSERT ON group_account
 FOR EACH ROW
 BEGIN
     IF NEW.joined_date > CURRENT_DATE THEN
           SET NEW.joined_date = CURRENT_DATE;
     END  IF;
 
 END $$
 DELIMITER ;
 -- vd:
 DROP TRIGGER IF EXISTS trigger_02;
 DELIMITER $$
 CREATE TRIGGER trigger_02
 BEFORE INSERT ON group_account
 FOR EACH ROW
 BEGIN
     IF NEW.joined_date > CURRENT_DATE THEN
     SIGNAL SQLSTATE "12345"
           SET MESSAGE_TEXT = " thoi gian tham gia khong hop le";
           
     END  IF;
 
 END $$
 DELIMITER ;
 
INSERT INTO group_account (group_id ,account_id, joined_date)
VALUE (5, 1, "4000-04_04");
-- hien thi danh sach trigger
SHOW TRIGGERS;

-- CASE WHEN
SELECT *,
     CASE
         WHEN duration <= 45 THEN "short time" -- duration <= 45
         WHEN duration <= 100 THEN " medium time" -- 45 < duration <=100
         ELSE "long time" -- duration >100
         
     END AS duration_type
     FROM exam;
     
     
-- INDEX : danh chi muc
CREATE INDEX index_name 
ON department (department_name);
--
CREATE INDEX index_email_username
ON account (email,username);
-- 
SELECT *
FROM department
WHERE department_name = "sale";
-- xoa index
DROP INDEX index_name ON department;
--
SHOW INDEX FROM department;


