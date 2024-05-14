-- menh de SELECT
SELECT CURRENT_DATE;
SELECT pi();
SELECT 1+1;
SELECT "thong";
SELECT CURRENT_DATE AS "today" , NOW() AS "now";
SELECT CURRENT_DATE  "today" , NOW() "now";

-- menh de FROM 
SELECT  department_name, department_id
FROM department;
-- * : tat ca
SELECT *
FROM question;

-- menh de WHERE 
-- toan tu : > , >= , < , <= ,= , != (<>)
SELECT *
FROM department
WHERE department_id > 5;
-- AND, OR
SELECT *
FROM department
WHERE department_id >= 3 AND department_id <= 8;

-- BETWEEN ... AND... 
SELECT *
FROM department
WHERE department_id BETWEEN 3 AND 8;

-- IN 
SELECT *
FROM department
WHERE department_id IN (2,4,6,8);
 
-- LIKE 
-- _: dai dien cho 1 ky tu
-- %: dai dien cho 0 haoc nhieu ki tu 
SELECT *
FROM department
WHERE department_name LIKE "%n%";
 -- IS NULL / IS NOT NULL
 SELECT *
 FROM department
 WHERE department_name IS NOT NULL;
 -- menh de LIMIT 
 SELECT *
 FROM department
 LIMIT 5;
 -- 
  SELECT *
 FROM department
 LIMIT 6,3;-- start:phan tu bat dau lay,number: 






















