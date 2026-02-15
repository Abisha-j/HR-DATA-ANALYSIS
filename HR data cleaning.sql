SELECT * FROM project.hr;

#CHANGEING THE 
alter table hr change column ï»¿id emp_id varchar(50);

describe hr;

select birthdate from hr;

#changing the security update.
set sql_safe_updates=0;

#formating the date values
update hr
set birthdate= CASE
when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y/%m/%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y/%m/%d')
Else null
end;

#changing the column data type
alter table hr modify column birthdate DATE;

#formating the date values
update hr
set hire_date= CASE
when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y/%m/%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y/%m/%d')
Else null
end;

#changing the column data type
Alter table hr modify column hire_date date;

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

#adding a new column
Alter table hr add column age INT;

#calculating the age
update hr set age=timestampdiff(Year,birthdate,curdate());

select min(age)AS youngest,max(age) from hr;

SELECT * FROM hr WHERE YEAR(birthdate) > YEAR(CURDATE());
select * from hr where age<0;




