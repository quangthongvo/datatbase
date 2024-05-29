DROP DATABASE IF EXISTS assignment_077;
CREATE DATABASE assignment_07;
USE assignment_07;

-- Tạo bảng department
DROP TABLE IF EXISTS department;
CREATE TABLE department (
  department_id INT PRIMARY KEY AUTO_INCREMENT,
  department_name VARCHAR(50) 
);

-- Tạo bảng position
DROP TABLE IF EXISTS position;
CREATE TABLE position (
  position_id INT PRIMARY KEY AUTO_INCREMENT,
  position_name ENUM("Dev", "Test", "Scrum Master", "PM") 
);

-- Tạo bảng account
DROP TABLE IF EXISTS account;
CREATE TABLE account (
  account_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(50) ,
  username VARCHAR(50) ,
  full_name VARCHAR(50) ,
  department_id INT,
  position_id INT,
  created_date DATE ,
  FOREIGN KEY (department_id) REFERENCES department (department_id),
  FOREIGN KEY (position_id) REFERENCES position (position_id)
);

-- Tạo bảng group
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  group_id INT PRIMARY KEY AUTO_INCREMENT,
  group_name VARCHAR(50) ,
  creator_id INT,
  created_date DATE DEFAULT (CURRENT_DATE),
  FOREIGN KEY (creator_id) REFERENCES account (account_id)
);

-- Tạo bảng group_account
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account (
  group_id INT,
  account_id INT,
  joined_date DATE DEFAULT (CURRENT_DATE),
  PRIMARY KEY (group_id, account_id),
  FOREIGN KEY (group_id) REFERENCES `group` (group_id),
  FOREIGN KEY (account_id) REFERENCES account (account_id)
);

-- Tạo bảng type_question
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question (
  type_id INT PRIMARY KEY AUTO_INCREMENT,
  type_name ENUM("Essay", "Multiple-Choice") 
);

-- Tạo bảng category_question
DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(50) 
);

-- Tạo bảng question
DROP TABLE IF EXISTS question;
CREATE TABLE question (
  question_id INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(50) ,
  category_id INT,
  type_id INT,
  creator_id INT,
  created_date DATE DEFAULT (CURRENT_DATE),
  FOREIGN KEY (category_id) REFERENCES category_question (category_id),
  FOREIGN KEY (type_id) REFERENCES type_question (type_id),
  FOREIGN KEY (creator_id) REFERENCES account (account_id)
);

-- Tạo bảng answer
DROP TABLE IF EXISTS answer;
CREATE TABLE answer (
  answer_id INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(50),
  question_id INT,
  is_correct BOOLEAN ,
  FOREIGN KEY (question_id) REFERENCES question (question_id)
);

-- Tạo bảng exam
DROP TABLE IF EXISTS exam;
CREATE TABLE exam (
  exam_id INT PRIMARY KEY AUTO_INCREMENT,
  code CHAR(10),
  title VARCHAR(50) ,
  category_id INT,
  duration INT,
  creator_id INT,
  created_date DATE DEFAULT (CURRENT_DATE),
  FOREIGN KEY (category_id) REFERENCES category_question (category_id),
  FOREIGN KEY (creator_id) REFERENCES account (account_id)
);

-- Tạo bảng exam_question
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question (
  exam_id INT,
  question_id INT,
  PRIMARY KEY (exam_id, question_id),
  FOREIGN KEY (exam_id) REFERENCES exam (exam_id),
  FOREIGN KEY (question_id) REFERENCES question (question_id)
);

-- Thêm dữ liệu cho bảng department
INSERT INTO department (department_name)
VALUES      ("Marketing"  ),
            ("Sale"     ),
            ("Bảo vệ"    ),
            ("Nhân sự"   ),
            ("Kỹ thuật"   ),
            ("Tài chính"  ),
            ("Phó giám đốc" ),
            ("Giám đốc"   ),
            ("Thư kí"    ),
            ("Bán hàng"   ); 

-- Thêm dữ liệu cho bảng position
INSERT INTO position  (position_name )
VALUES      ("Dev"     ),
            ("Test"    ),
            ("Scrum Master"),
            ("PM"     );

-- Thêm dữ liệu cho bảng account
INSERT INTO account (email              , username   , full_name      , department_id, position_id, created_date)
VALUES    ("haidang29productions@gmail.com", "dangblack"  , "Nguyen Hai Dang"  , 5      , 1     , "2020-03-05"),
          ("account1@gmail.com"      , "quanganh"  , "Tong Quang Anh"  , 1      , 2     , "2020-03-05"),
          ("account2@gmail.com"      , "vanchien"  , "Nguyen Van Chien" , 2      , 3     , "2020-03-07"),
          ("account3@gmail.com"      , "cocoduongqua", "Duong Do"     , 3      , 4     , "2020-03-08"),
          ("account4@gmail.com"      , "doccocaubai" , "Nguyen Chien Thang", 4      , 4     , "2020-03-10"),
          ("dapphatchetngay@gmail.com"   , "khabanh"   , "Ngo Ba Kha"    , 6      , 3     , "2020-04-05"),
          ("songcodaoly@gmail.com"     , "huanhoahong" , "Bui Xuan Huan"   , 2      , 2     , "2020-04-05"),
          ("sontungmtp@gmail.com"     , "tungnui"   , "Nguyen Thanh Tung" , 8      , 1     , "2020-04-07"),
          ("duongghuu@gmail.com"      , "duongghuu"  , "Duong Van Huu"   , 9      , 2     , "2020-04-07"),
          ("vtiaccademy@gmail.com"     , "vtiaccademy" , "Vi Ti Ai"     , 10      , 1     , "2020-04-09");

-- Thêm dữ liệu cho bảng group
INSERT INTO `group` (group_name     , creator_id, created_date)
VALUES    ("Testing System"  , 5     , "2019-03-05"),
          ("Developement"   , 1     , "2020-03-07"),
          ("VTI Sale 01"   , 2     , "2020-03-09"),
          ("VTI Sale 02"   , 3     , "2020-03-10"),
          ("VTI Sale 03"   , 4     , "2020-03-28"),
          ("VTI Creator"   , 6     , "2020-04-06"),
          ("VTI Marketing 01" , 7     , "2020-04-07"),
          ("Management"    , 8     , "2020-04-08"),
          ("Chat with love"  , 9     , "2020-04-09"),
          ("Vi Ti Ai"     , 10    , "2020-04-10");

-- Thêm dữ liệu cho bảng group_account
INSERT INTO group_account  (group_id, account_id, joined_date )
VALUES        (1    , 1     , "2019-03-05"),
              (2    , 2     , "2020-03-07"),
              (3    , 3     , "2020-03-09"),
              (2    , 4     , "2020-03-10"),
              (5    , 5     , "2020-03-28"),
              (2    , 6     , "2020-04-06"),
              (7    , 7     , "2020-04-07"),
              (3    , 8     , "2020-04-08"),
              (2    , 9     , "2020-04-09"),
              (10   , 10    , "2020-04-10");

-- Thêm dữ liệu cho bảng type_question
INSERT INTO type_question (type_name) VALUES ("Essay"), ("Multiple-Choice"); 

-- Thêm dữ liệu cho bảng category_question
INSERT INTO category_question  (category_name)
VALUES          ("Java"    ),
                ("ASP.NET"  ),
                ("ADO.NET"  ),
                ("SQL"    ),
                ("Postman"  ),
                ("Ruby"    ),
                ("Python"   ),
                ("C++"    ),
                ("C Sharp"  ),
                ("PHP"    ); 

-- Thêm dữ liệu cho bảng question
INSERT INTO question  (content     , category_id, type_id, creator_id, created_date)
VALUES      ("Câu hỏi về Java", 1     , 1   , 1     , "2020-04-05"),
            ("Câu Hỏi về PHP" , 10     , 2   , 2     , "2020-04-05"),
            ("Câu Hỏi về C#"   , 9     , 2   , 3     , "2020-04-06"),
            ("Câu Hỏi về Ruby"  , 6     , 1   , 2     , "2020-04-06"),
            ("Câu Hỏi về Postman" , 5     , 1   , 3     , "2020-04-06"),
            ("Câu Hỏi về ADO.NET" , 3     , 2   , 6     , "2020-04-06"),
            ("Câu Hỏi về ASP.NET" , 2     , 1   , 2     , "2020-04-06"),
            ("Câu Hỏi về C++"   , 8     , 1   , 8     , "2020-04-07"),
            ("Câu Hỏi về SQL"   , 4     , 2   , 3     , "2020-04-07"),
            ("Câu Hỏi về Python" , 7     , 1   , 10    , "2020-04-07");

-- Thêm dữ liệu cho bảng answer
INSERT INTO answer (content   , question_id, is_correct)
VALUES    ("Trả lời 01", 1     , 0     ),
          ("Trả lời 02", 1     , 1     ),
          ("Trả lời 03", 1     , 0     ),
          ("Trả lời 04", 1     , 1     ),
          ("Trả lời 05", 2     , 1     ),
          ("Trả lời 06", 3     , 1     ),
          ("Trả lời 07", 4     , 0     ),
          ("Trả lời 08", 8     , 0     ),
          ("Trả lời 09", 9     , 1     ),
          ("Trả lời 10", 10     , 1     );

-- Thêm dữ liệu cho bảng exam
INSERT INTO exam  (code  , title      , category_id, duration, creator_id, created_date)
VALUES    ("VTIQ001", "Đề thi C#"   , 1     , 60   , 3     , "2019-04-05"),
          ("VTIQ002", "Đề thi PHP"  , 10     , 60   , 1     , "2019-04-05"),
          ("VTIQ003", "Đề thi C++"  , 9     , 120   , 2     , "2019-04-07"),
          ("VTIQ004", "Đề thi Java"  , 7     , 60   , 3     , "2020-04-08"),
          ("VTIQ005", "Đề thi Ruby"  , 5     , 120   , 4     , "2020-04-10"),
          ("VTIQ006", "Đề thi Postman", 8     , 60   , 6     , "2020-04-05"),
          ("VTIQ007", "Đề thi SQL"    , 7     , 60   , 1     , "2020-04-05"),
          ("VTIQ008", "Đề thi Python" , 8     , 60   , 8     , "2020-04-07"),
          ("VTIQ009", "Đề thi ADO.NET", 4     , 90   , 3     , "2020-04-07"),
          ("VTIQ010", "Đề thi ASP.NET", 7     , 90   , 10    , "2020-04-08");

-- Thêm dữ liệu cho bảng exam_question
INSERT INTO exam_question  (question_id, exam_id)
VALUES        (1     , 1   ),
              (2     , 2   ),
              (3     , 1   ),
              (4     , 4   ),
              (5     , 1   ),
              (6     , 2   ),
              (7     , 1   ),
              (8     , 8   ),
              (9     , 2   ),
              (10    , 10  );
              
-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
DROP TRIGGER IF EXISTS trigger_01;
 DELIMITER $$
 CREATE TRIGGER trigger_01
 BEFORE INSERT ON `group`
 FOR EACH ROW
 BEGIN
    IF NEW.created_date < CURRENT_DATE - INTERVAL 1 YEAR THEN
    SIGNAL SQLSTATE "12345"
    SET MESSAGE_TEXT = " khong cho phep tao 1 nam truoc";

    
    END IF;
 END $$
 DELIMITER ;
-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department "Sale" cannot add more user"
DROP TRIGGER IF EXISTS trigger_02;
 DELIMITER $$
 CREATE TRIGGER trigger_02
 BEFORE INSERT ON account
 FOR EACH ROW
 BEGIN
   DECLARE v_sale_id INT;
   SELECT department_id INTO v_sale_id
   FROM department
   WHERE department_name = "sale";
   
   IF NEW.department_id = v_sale_id THEN
   SIGNAL SQLSTATE "12345"
   SET MESSAGE_TEXT = " khong cho phep nguoi dung them bat ky user nao vao";
 END IF;
END $$
 DELIMITER ;
-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS trigger_03;
 DELIMITER $$
 CREATE TRIGGER trigger_03
 BEFORE INSERT ON group_account
 FOR EACH ROW
 BEGIN
 DECLARE v_account_count INT;
 SELECT COUNT(account_id) INTO v_account_count 
 FROM group_account
 WHERE group_id = NEW.group_id;
 
 IF v_account_count >= 5 then
 SIGNAL SQLSTATE "12345"
   SET MESSAGE_TEXT = " moi group co nhieu nhat 5 nguoi";
 END IF;
 
 END $$
 DELIMITER ;
-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS trigger_04;
 DELIMITER $$
 CREATE TRIGGER trigger_04
 BEFORE INSERT ON exam_question
 FOR EACH ROW
 BEGIN
  DECLARE v_question_count INT;
  SELECT COUNT(question_id) INTO v_question_count
  FROM exam_question
  WHERE exam_id = NEW.exam_id;
  IF v_question_count >= 10 THEN
 SIGNAL SQLSTATE "12345"
   SET MESSAGE_TEXT = " moi bai thi co nhieu nhat 10 question";
 END IF;
 END $$
 DELIMITER ;
-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó

DROP TRIGGER IF EXISTS trigger_05;
 DELIMITER $$
 CREATE TRIGGER trigger_05
 BEFORE DELETE ON account
 FOR EACH ROW
 BEGIN
     IF OLD.email = "admin@gmail.com" THEN
     SIGNAL SQLSTATE "12345"
   SET MESSAGE_TEXT = "tài khoản admin, không cho phép user xóa";
 END IF;
 
 END $$
 DELIMITER ;
-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
DROP TRIGGER IF EXISTS trigger_06;
 DELIMITER $$
 CREATE TRIGGER trigger_06
 BEFORE INSERT ON account
 FOR EACH ROW
 BEGIN
 DECLARE v_department_id INT;
 
 IF NEW.department_id IS NULL THEN
 SELECT department_id INTO v_department_id
 FROM department_id
 WHERE deparment_name = "phong cho";
 
 SET NEW.department_id = v_department_id;
 END IF;
 END $$
 DELIMITER ;
-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
-- question, trong đó có tối đa 2 đáp án đúng.
DROP TRIGGER IF EXISTS trigger_07;
 DELIMITER $$
 CREATE TRIGGER trigger_07
 BEFORE INSERT ON answer
 FOR EACH ROW
BEGIN
 DECLARE v_answer_count INT;
 DECLARE v_correct_answer_count INT;
 SELECT COUNT(answer_id) INTO v_answer_count
 FROM answer
 WHERE question_id = NEW.question_id;
 
 IF v_answer_count >= 4 THEN
 SIGNAL SQLSTATE "12345"
 SET MESSAGE_TEXT = "cho phép user tạo tối đa 4 answers";
   END IF;
   
 SELECT COUNT(answer_id) INTO v_correct_answer_count
 FROM answer
 WHERE question_id = NEW.question_id AND is_correct = TRUE;
 
 IF v_correct_answer_count >= 2 THEN
 SIGNAL SQLSTATE "12345"
 SET MESSAGE_TEXT = "tối đa 2 đáp án đúng ";
END IF;
END $$
 DELIMITER ;

-- Question 8: Viết trigger sửa lại dữ liệu cho đúng:
-- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
-- Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS trigger_09;
 DELIMITER $$
 CREATE TRIGGER trigger_09
 BEFORE DELETE ON exam
 FOR EACH ROW
BEGIN
IF OLD.created_date > CURRENT_DATE - INTERVAL 2 DAY THEN
SIGNAL SQLSTATE "12345"
 SET MESSAGE_TEXT = "khong the xoa de thi moi tao duoc 2 ngay ";
END IF;

END $$
 DELIMITER ;
-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào
DROP TRIGGER IF EXISTS trigger_10_update;
 DELIMITER $$
 CREATE TRIGGER trigger_10_update
 BEFORE UPDATE ON question
 FOR EACH ROW
BEGIN
DECLARE v_exam_count INT;
SELECT COUNT(exam_id) INTO v_exam_count
FROM exam_question
WHERE question_id = OLD.question_id;

IF v_exam_count != 0 THEN
SIGNAL SQLSTATE "12345"
 SET MESSAGE_TEXT = "co de thi dang su dung cau hoi nay ";
END IF;
END $$
 DELIMITER ;
 DROP TRIGGER IF EXISTS trigger_10_delete;
DELIMITER $$
 CREATE TRIGGER trigger_10_delete
 BEFORE DELETE ON question
 FOR EACH ROW
BEGIN
DECLARE exam_count INT;
SELECT COUNT(exam_id) INTO exam_count
FROM exam_question
WHERE question_id = OLD.question_id;

IF exam_count != 0 THEN
SIGNAL SQLSTATE "12345"
 SET MESSAGE_TEXT = "delete các question khi question đó chưa nằm trong exam nào";
END IF;
END $$
 DELIMITER ;
-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"
SELECT *,
CASE 
    WHEN duration <= 30 THEN "short time"
    WHEN duration <= 60 THEN "medium time"
    ELSE "long time"
END AS duration_type
FROM exam;
-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
-- là the_number_user_amount và mang giá trị được quy định như sau:
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher

SELECT `group`.*,COUNT(account_id) AS account_count,
CASE 
    WHEN COUNT(account_id) <= 5 THEN "few"
    WHEN COUNT(account_id) <= 20 THEN "normal"
    ELSE "higher"
    END AS  the_number_user_amount
FROM `group`
LEFT JOIN group_account USING (group_id)
GROUP BY group_id;
-- CTE
WITH c_13 AS (
SELECT `group`.*,COUNT(account_id) AS account_count
FROM `group`
LEFT JOIN group_account USING (group_id)
GROUP BY group_id
)
SELECT *,
CASE 
    WHEN account_count <= 5 THEN "few"
    WHEN account_count <= 20 THEN "normal"
    ELSE "higher"
    END AS  the_number_user_amount
FROM c_13;

-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
-- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
WITH c_14 AS (
SELECT department.*,COUNT(account_id) AS account_count
FROM department
LEFT JOIN account USING (department_id)
GROUP BY department_id
)
SELECT *,
 CASE 
     WHEN account_count = 0 THEN " khong co user"
     ELSE account_count

 END AS account_number
 FROM c_14;
    
    
    


		
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        