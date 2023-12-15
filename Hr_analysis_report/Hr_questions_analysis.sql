-- QUESTIONS

-- What is the gender breakdown in company ?
SELECT DISTINCT gender, count(*) as count from hrr
group by gender;

--  What is the race breakdown of employees in the company?
SELECT race,count(race) from hrr 
GROUP BY race;

-- Whatr is the age distribution of employees in company ?
SELECT CASE 
	when age >= 20 and age <= 30 then '20-30'
    when age >= 31 and age <= 40 then '31-40'
    when age >= 41 and age <= 50 then '41-50'
    when age >= 51 and age <= 60 then '51-60'
    Else '61+'
    END as age_group,
    count(*) as count 
    from hrr GROUP BY age_group
    ORDER BY age_group;
    
-- How many employees work at headquaters vs remote ?
select location, count(emp_id) as count from hrr
group by location;
    
-- What is the average length of employment for employees who have been terminatd ?
SELECT hire_date, termdate from hrr;
SELECT round(avg(datediff(termdate, hire_date))/365,0) as average_length 
from hrr;

-- What is the gender distribution vary across department and job title ?

select department , gender, count(*) from hrr
group by gender, department
order by department;

select jobtitle, gender, count(*) from hrr
group by gender, jobtitle
order by jobtitle;

-- What is the distribution of employees across locations by city and state?
select location_state,count(*) as distribution_rate
from hrr
group by  location_state;

select location_city,count(*) as distribution_rate
from hrr
group by  location_city;




