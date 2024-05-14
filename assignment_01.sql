DROP DATABASE IF EXISTS assignment_01;
CREATE DATABASE assignment_01;
USE  assignment_01;

CREATE TABLE department (
   department_id INT PRIMARY KEY AUTO_INCREMENT ,
   department_name VARCHAR(50)
   );
   
CREATE TABLE position (
    position_id INT PRIMARY KEY AUTO_INCREMENT,
    poistion_name ENUM("dev", "test", "scum master", "PM")
    );
CREATE TABLE account (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50),
    username VARCHAR(50),
    full_name VARCHAR(50),
    deparrtment_id INT,
    position_id INT,
    create_date DATE
);
CREATE TABLE `group` (
    group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(50),
    create_ID INT,
    create_date DATE
);
CREATE TABLE group_account (
    group_id INT,
    account_id INT,
    join_date DATE,
    PRIMARY KEY ( group_id, account_id)
    );
CREATE TABLE type_question (
    type_id INT,
    type_name ENUM("essay", "multiple_choice")
);
CREATE TABLE category_quyestion (
    category_id INT,
    category_name VARCHAR(50)
);
CREATE TABLE question (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50),
    category_id INT,
    type_id INT,
    create_id INT,
    create_date DATE
);
CREATE TABLE answer (
    answer_id INT PRIMARY KEY AUTO_INCREMENT,
    contet VARCHAR(50),
    question_id INT,
    is_correct BOOLEAN
);
CREATE TABLE exam (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    code CHAR(10),
    title VARCHAR(50),
    category_id INT,
    duratoin INT,
    create_id INT,
    create_date DATE
);
CREATE TABLE exam_question (
    exam_id INT,
    question_id INT
);






















    
  