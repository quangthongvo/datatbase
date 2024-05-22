DROP DATABASE IF EXISTS assignment_04;
CREATE DATABASE assignment_04;
USE assignment_04;

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
              
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT*
FROM account
INNER JOIN department USING (department_id);
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT * 
FROM account
JOIN department USING (department_id)
JOIN position USING (position_id)
WHERE created_date > "2010-12-20"
;
-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT *
FROM account
JOIN position USING (position_id)
WHERE position_name = "Dev";
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT department.*
FROM account
JOIN department USING (department_id)
GROUP BY department_id
HAVING COUNT(department_id) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT question.*,COUNT(exam_id) AS exam_count
FROM question
LEFT JOIN exam_question USING (question_id)
GROUP BY question_id
ORDER BY COUNT(exam_id) DESC
LIMIT 1;
-- SUBQUERY
CREATE OR REPLACE VIEW view_01 AS
SELECT question.*
FROM question
LEFT JOIN exam_question USING (question_id)
GROUP BY question_id 
HAVING COUNT(question_id) = (
SELECT MAX(exam_count)
FROM (
SELECT COUNT(exam_id) AS exam_count
FROM question
LEFT JOIN exam_question USING (question_id)
GROUP BY question_id ) AS t);
-- CTE
WITH c2 AS (
SELECT question.*, COUNT(exam_id) AS exam_count
FROM question
LEFT JOIN exam_question USING (question_id)
GROUP BY question_id 
)
SELECT *
FROM c2
WHERE exam_count = (
SELECT MAX(exam_count)
FROM c2);
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT category_question.*, COUNT(question_id) AS question_count
FROM question
RIGHT JOIN category_question USING (category_id)
GROUP BY category_id;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT question.*, COUNT(exam_id) AS exam_count
FROM question
LEFT JOIN exam_question USING (question_id)
GROUP BY question_id;
-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT question.*,COUNT(answer_id) AS answer_count
FROM answer
INNER JOIN question USING (question_id)
GROUP BY question_id
ORDER BY COUNT(answer_id) DESC
LIMIT 1;
-- SUBQUERY
CREATE OR REPLACE VIEW view_02 AS
SELECT question.*
FROM answer
INNER JOIN question USING (question_id)
GROUP BY question_id
HAVING count(question_id) = (
SELECT MAX(answer_count)
FROM (
     SELECT COUNT(answer_id) AS answer_count
     FROM answer
     INNER JOIN question USING (question_id)
     GROUP BY question_id) AS t);
-- CTE
WITH c1 AS (
SELECT question.*, COUNT(answer_id) AS answer_count
     FROM answer
     INNER JOIN question USING (question_id)
     GROUP BY question_id
)
SELECT *
FROM c1
WHERE answer_count = (
SELECT MAX(answer_count)
FROM c1 );
-- Question 9: Thống kê số lượng account trong mỗi group
SELECT `group`.*, COUNT(account_id) AS account_count
FROM `group`
LEFT JOIN group_account USING (group_id)
GROUP BY group_id;
-- Question 10: Tìm chức vụ có ít người nhất
SELECT position.*
FROM position
LEFT JOIN account USING (position_id)
GROUP BY position_id
ORDER BY COUNT(account_id)
LIMIT 1;
-- SUBQUERY
CREATE OR REPLACE VIEW view_03 AS
SELECT position.*
FROM position
LEFT JOIN account USING (position_id)
GROUP BY position_id
HAVING count(position_id) = (
SELECT MIN(account_count)
FROM (
     SELECT  COUNT(account_id) AS account_count
	 FROM position
     LEFT JOIN account USING (position_id)
     GROUP BY position_id) AS t);
-- CTE
WITH c3 AS (
SELECT position.*, COUNT(account_id) AS account_count
	 FROM position
     LEFT JOIN account USING (position_id)
     GROUP BY position_id
)
SELECT *
FROM c3
WHERE account_count = (
SELECT MIN(account_count)
FROM c3);


-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT position_name,department_name, COUNT(account_id) AS accoun_count
FROM department
CROSS JOIN position
LEFT JOIN account USING (department_id,position_id)
GROUP BY position_name, department_name;
-- c2
SELECT department_name,position_name, COUNT(account_id) AS account_count
FROM department
CROSS JOIN position
LEFT JOIN account USING (department_id, position_id)
GROUP BY department_id, position_id;
alter
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT *
FROM question
JOIN type_question USING (type_id)
JOIN account ON creator_id = account_id
JOIN answer USING (question_id);


-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT type_question.*,COUNT(question_id) AS question_count
FROM type_question
LEFT JOIN question USING (type_id)
GROUP BY type_id; 

-- Question 14:Lấy ra group không có account nào
-- Question 15: Lấy ra group không có account nào
SELECT `group`.*
FROM `group`
LEFT JOIN group_account USING (group_id)
WHERE account_id IS NULl;



-- Question 16: Lấy ra question không có answer nào.
SELECT question.*
FROM question
LEFT JOIN answer USING (question_id)
WHERE answer_id IS NULL;

 -- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT account.*
FROM group_account
JOIN account USING ( account_id)
WHERE group_id = 1;

-- b) Lấy các account thuộc nhóm thứ 2
SELECT account.*
FROM group_account
JOIN account USING ( account_id)
WHERE group_id = 2;
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT account.*
FROM group_account
JOIN account USING ( account_id)
WHERE group_id = 1
UNION
SELECT account.*
FROM group_account
JOIN account USING ( account_id)
WHERE group_id = 2;
-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT `group`.*, COUNT(account_id)
FROM `group`
JOIN group_account USING (group_id)
GROUP BY group_id
HAVING COUNT(account_id) > 5;
-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT `group`.*, COUNT(account_id)
FROM `group`
JOIN group_account USING (group_id)
GROUP BY group_id
HAVING COUNT(account_id) < 7;
-- c) Ghép 2 kết quả từ câu a) và câu b).
SELECT `group`.*, COUNT(account_id)
FROM `group`
JOIN group_account USING (group_id)
GROUP BY group_id
HAVING COUNT(account_id) > 5
UNION
SELECT `group`.*, COUNT(account_id)
FROM `group`
JOIN group_account USING (group_id)
GROUP BY group_id
HAVING COUNT(account_id) < 7;























