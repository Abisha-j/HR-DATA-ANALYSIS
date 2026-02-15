#QUESTIONS

#1 what is the gender breakdown of employees in the company?

select gender,count(*) As count
from hr 
where age>=18 and termdate='0000-00-00' 
group by gender;

#2 What is the race/ethnicity breakdown of employees in the company?

select race,count(*) AS count
from hr
where age>=18 and termdate='0000-00-00'
group by race
order by count DESC;

#3 what is the age distribution of employees in the company?

select min(age)As youngest, max(age)AS oldest
from hr
where age>=18 AND termdate='0000-00-00';

select 
case
when age>= 18 and age<=24 Then '18-24'
when age>= 25 and age<=34 Then '25-34'
when age>= 35 and age<=44 Then '35-44'
when age>= 45 and age<=54 Then '45-54'
when age>= 55 and age<=64 Then '55-64'
else '65+'
end as age_group,
count(*) AS count
from hr
where age>=18 AND termdate='0000-00-00'
group by age_group
order by age_group;

select 
case
when age>= 18 and age<=24 Then '18-24'
when age>= 25 and age<=34 Then '25-34'
when age>= 35 and age<=44 Then '35-44'
when age>= 45 and age<=54 Then '45-54'
when age>= 55 and age<=64 Then '55-64'
else '65+'
end as age_group,gender,
count(*) AS count
from hr
where age>=18 AND termdate='0000-00-00'
group by age_group,gender
order by age_group,gender;

#4 how many employees work at headquaters versus remote location
select location,count(*)as count
from hr
where age>=18 AND termdate='0000-00-00'
group by location;

#5 What is the average length of employment for employees who have been terminated
select
round(avg(datediff(termdate,hire_date))/365,0) As avg_length_employment
from hr
where termdate<=curdate() and termdate<>'0000-00-00'and age>=18;

#6 how does the gender distribution vary across departments and job title
select department,gender,count(*)as count
from hr
where age>=18 AND termdate='0000-00-00'
group by department,gender
order by department,gender;


#7 what is the distribution of job titles across the compmany?
select jobtitle,count(*)as count
from hr
where age>=18 AND termdate='0000-00-00'
group by jobtitle
order by jobtitle desc;

#8 which department has the highest turnover rate?
select department,
total_count,
terminated_count,
terminated_count/total_count as termination_rate
from(
select department,count(*)as total_count,
sum(case when termdate<>'0000-00-00' AND termdate<=curdate() then 1 else 0 end)as terminated_count
from hr
where age>=18
group by department
)as subquery
order by termination_rate desc;

#9 What is the distribution of employees across locations by city and states?
select location_state,Count(*)as count
from hr
where age>=18 and termdate='0000-00-00'
group by location_state
order by count desc;

#10 how has the company's employee count changed over time based on hire and term date
select 
   year,
   hires,
   terminations,
   hires-terminations as net_changes,
   round((hires-terminations)/hires*100,2)as net_change_percent
from(
select year(hire_date)as year,
count(*) as hires,
sum(case when termdate<>'0000-00-00' AND termdate<=curdate() then 1 else 0 end)as terminations
from hr
where age>=18
group by year(hire_date)
)as subquery
order by year ;

#11 what is the tenure distribution for each department
select department,round(avg(datediff(termdate,hire_date)/365),0) as avg_tenure
from hr
where termdate<=curdate() and termdate<>'0000-00-00' and age>=18
group by department;
