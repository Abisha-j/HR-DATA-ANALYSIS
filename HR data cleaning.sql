#View Full HR Dataset
SELECT * FROM project.hr;

#Rename Incorrect ID Column to Employee ID
alter table hr change column ï»¿id emp_id varchar(50);

#Check Table Structure
describe hr;

select birthdate from hr;

#Disable Safe Update Mode
set sql_safe_updates=0;

#Format Birthdate Values into Standard Date Format
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

#Format Termination Date Values and Handle Missing Term Dates
UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

#Verify Termination Date Values
SELECT termdate from hr;

#Allow Invalid Dates in SQL Mode
SET sql_mode = 'ALLOW_INVALID_DATES';

#Change Termination Date Column Data Type to DATE
ALTER TABLE hr
MODIFY COLUMN termdate DATE;

#adding a new column
Alter table hr add column age INT;

#calculating the age
update hr set age=timestampdiff(Year,birthdate,curdate());

#Check Youngest and Oldest Employee Age
select min(age)AS youngest,max(age) from hr;

#Identify Invalid Future Birthdates
SELECT * FROM hr WHERE YEAR(birthdate) > YEAR(CURDATE());

#Identify Employees with Negative Age Values
select * from hr where age<0;

#To Filter Only Adult Employees AND Only Active Employees
SELECT *
FROM hr
WHERE age >= 18
AND termdate = '0000-00-00';




