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

-- ORDER BY : sắp xếp
-- ASC, desc
-- mac dinh ASC
 SELECT *
 FROM exam
 ORDER BY duration DESC,created_date ASC;
 -- ham tong hop 
 -- COUNT(*): dem so dong 
 SELECT COUNT(*) AS exam_COUNT
 FROM exam ;
 -- COUNT(id): dem so dong ma id IS NOT NULL 
 
 INSERT INTO exam (exam_id, code, title, category_id, duration, creator_id)
VALUES 			 ('11', 'VTIQ011', 'Đề thi MySQL', '2', null, '9');
 
-- SUM,MAX,MIN,AVG
SELECT 
  SUM(duration),
  MAX(duration),
  MIN(duration),
  AVG(duration)
FROM exam;

-- menh de GROUP BY
SELECT duration, COUNT(exam_id) AS exam_count
FROM exam
GROUP BY duration;

SELECT duration, create_date, COUNT(exam_id) AS exam_count
FROM exam
GROUP BY duration,create_date
ORDER BY duration,created_date;


-- menh de HAVING 
SELECT duration, created_date, COUNT(exam_id) AS exam_count
FROM exam
GROUP BY duration,created_date
HAVING COUNT(exam_id) > 1
ORDER BY duration,created_date;
-- cap nhat du lieu
UPDATE department
SET department_name = " phong cho"
WHERE department_id = 1;
-- xoa du lieu
DELETE FROM exam
WHERE duration IS NULL;





























