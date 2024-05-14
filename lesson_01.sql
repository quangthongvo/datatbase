-- xoa co so du lieu
DROP DATABASE IF EXISTS lesson_01;

-- tao co so du lieu 
CREATE DATABASE lesson_01;

-- hien thi co so du lieu
SHOW DATABASES;

-- chon co so du lieu muon thao tac
USE lesson_01;
-- kieu du lieu
-- so nguyen:TINYINT,SMALLINT,MEDIUMINT,INT,BIGINT,
-- so thuc: FLOAT, DOUBLE
-- chuoi : VARCHAR(50), CHAR(50)
-- thoi gian: DATE(yyy-mm-dd), TIME, DATETIME
-- logic : BOOLEAN , BIT
-- enum : ENUM ("loading",, "success", "error")
-- xao bang neu ton tai
DROP TABLE IF EXISTS department;
-- tao bang:
CREATE TABLE department(
   id    INT,
   name  VARCHAR(50),
   create_date DATE
   
)
;
-- them du lieu vao bang
INSERT INTO department (id , name, create_date)
VALUES (1, " bao ve ", " 2020-03-15 "),
	   (2, " giao vien ", "2019-05-25"),
       (3, " giam doc ", "2022-03-17");

-- hien thi du lieu
TABLE department;
-- hoac
SELECT * 
FROM department;

-- rang buoc du lieu 
-- khoa chinh (PRIMARY KEY)
-- 1. mot bang co toi da mot khoa chinh
-- 2. gia tri duy nhat 
-- 3. khong duoc de trong (NOT NULL)
-- 4. tu dong tang : AUTO_INCREMENT
-- 
CREATE TABLE  product (
     id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(50)
);
INSERT INTO  product (id , name)
VALUES  ( 1, "chuot may tinh"),
		( 2, "ban phim may tinh");
INSERT INTO  product ( name)
VALUES  ( "tu lanh");


-- NOT NULL : khong duoc den trong
DROP TABLE IF EXISTS question ;
CREATE TABLE question (
id INT PRIMARY KEY AUTO_INCREMENT,
content VARCHAR(50) NOT NULL
);
INSERT INTO  question ( content)
VALUES  (" ");
-- UNIQUE KEY : khoa duy nhat 
DROP TABLE IF EXISTS customer ;
CREATE TABLE customer (
id INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(50) UNIQUE KEY
);
INSERT INTO  customer ( email)
VALUES  (NULL);
-- 
INSERT INTO  customer ( email)
VALUES  (" " );
-- DEFAULT : mac dinh
DROP TABLE IF EXISTS customer ;
CREATE TABLE customer (
id INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(50) UNIQUE KEY DEFAULT "thong2002@gmail.com" ,
create_date DATE DEFAULT (CURRENT_DATE)
);
INSERT INTO  customer (id)
VALUES  (50);

-- check :kiem tra
DROP TABLE IF EXISTS `user` ;
CREATE TABLE `user` (
id INT PRIMARY KEY AUTO_INCREMENT,
age INT CHECK (age >=18)
);
INSERT INTO `user` (age)
VALUES ( 20 ); 

-- FROEIGN KEY : khoa ngoai
DROP TABLE IF EXISTS department ;
CREATE TABLE department (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50)
);
--
DROP TABLE IF EXISTS  account ;
CREATE TABLE account (
id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(50) ,
department_id INT ,
FOREIGN KEY (department_id ) REFERENCES department(id)
ON UPDATE CASCADE ON DELETE CASCADE
);

 INSERT INTO department(id , name)
 VALUES (100, "bao ve");
 
 INSERT INTO account ( full_name , department_id )
 VALUES ("Vo Quang Thong", 100); 























