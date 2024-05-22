-- SUBQUERY :truy van con
-- thu tu chay : tu trong ra ngoai
-- VD: lay ra tat ca chuc vu co it nguoi nhat
SELECT position.*,COUNT(account_id) AS account_count
FROM position
LEFT JOIN account USING (position_id)
GROUP BY position_id
HAVING COUNT(account_id) = (
		SELECT MIN(account_count)
		FROM (
			SELECT COUNT(account_id) AS account_count
			FROM position
			LEFT JOIN account USING (position_id)
			GROUP BY position_id) AS t);
            
            
-- ANY , ALL, EXISTS
SELECT *
FROM account
WHERE department_id = ANY
      (SELECT department_id
      FROM department
      WHERE department_name IN ("bao ve", "sale"));
-- EXISTS 
SELECT *
FROM `group` AS t
WHERE  EXISTS view_01 ;
           ( SELECT *
           FROM group_account AS at
           WHERE at.group_id = t.group_id);
-- VIEW : bang ao

DROP VIEW IF EXISTS
CREATE OR REPLACE VIEW view_01 AS
SELECT *
FROM department;

SELECT department_name
FROM view_01;

-- CTE : common Table Expression (bang tam duoc luu trong bo nho ram )
-- VD: lay ra tat ca phong ban co nhieu nhan vien nhat
WITH c1 AS(
SELECT department.*, COUNT(account_id) AS account_count
FROM department
LEFT JOIN account USING (department_id)
GROUP BY department_id
)
SELECT *
FROM c1
WHERE account_count =(
SELECT MAX(account_count)
FROM c1);









