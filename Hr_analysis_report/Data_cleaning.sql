SELECT * FROM how.hrr;
describe hrr;

set SQL_SAFE_UPDATES = 0;
-- cleaning and fixing header of column 1

ALTER TABLE hrr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL; 

set SQL_SAFE_UPDATES = 0;

--  Formating dates to correct format

UPDATE hrr
SET birthdate = CASE
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
ELSE null
END;

ALTER TABLE hrr
MODIFY COLUMN birthdate DATE;

UPDATE hrr
SET hire_date = CASE
WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
ELSE null
END;

ALTER TABLE hrr
MODIFY COLUMN hire_date DATE;

-- Adding an age column 

ALTER TABLE hrr ADD COLUMN age INT;
select * from hrr;

UPDATE hrr
SET age = timestampdiff(YEAR,birthdate,CURDATE());

select 
 MIN(age) as youngest,
 max(age) as oldest
from hrr;