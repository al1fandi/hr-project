CREATE DATABASE projects;

USE projects;

SELECT * FROM hr;

-- DATA PREPARING AND CLEANING PROCESS 
-- change column name 
ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

SET sql_safe_updates = 0;

-- update birthdate column data format
UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL 
END;

-- change data type for column birthdate
ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

-- update hire_date column data format
UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL 
END;

-- change data type for column hire_date
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

-- update termdate column data format
UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

-- change data type for column termdate
ALTER TABLE hr
MODIFY COLUMN termdate DATE;

-- add age column
ALTER TABLE hr ADD COLUMN age INT;

-- add values to age column
UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT birthdate, age
FROM hr;

SELECT * FROM hr;

-- ANALYSIS PROCESS
-- Questions that will drive the analysis:
-- 1. What is the gender breakdown of employees in the company?
SELECT gender, COUNT(*) count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
SELECT race, COUNT(*) count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY race
ORDER BY count DESC;

-- 3. What is the age distribution of employees in the company?
SELECT MIN(age) youngest, MAX(age) oldest
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00';

SELECT
	CASE 
		WHEN age >= 18 AND age <=24 THEN '18-24'
		WHEN age >= 25 AND age <=34 THEN '25-34'
		WHEN age >= 35 AND age <=44 THEN '35-44'
		WHEN age >= 45 AND age <=54 THEN '45-54'
		WHEN age >= 55 AND age <=64 THEN '55-64'
		ELSE '65+'
	END AS age_group,
	COUNT(*) count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY age_group 
ORDER BY age_group;

SELECT
	CASE 
		WHEN age >= 18 AND age <=24 THEN '18-24'
		WHEN age >= 25 AND age <=34 THEN '25-34'
		WHEN age >= 35 AND age <=44 THEN '35-44'
		WHEN age >= 45 AND age <=54 THEN '45-54'
		WHEN age >= 55 AND age <=64 THEN '55-64'
		ELSE '65+'
	END AS age_group, gender,
	COUNT(*) count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY age_group, gender 
ORDER BY age_group, gender;

-- 4. How many employees work at headquarters versus remote locations?
SELECT location, COUNT(*) count 
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY location;

-- 5. What is the average length of employment for employees who have been terminated?
SELECT round(avg(datediff(termdate, hire_date))/365) avg_length_employment
FROM hr
WHERE termdate <= curdate() AND termdate <> '0000-00-00' AND age >= 18;

-- 6. How does the gender distribution vary across departments and job titles?
SELECT department, gender, COUNT(*) count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY department, gender
ORDER BY department;

SELECT jobtitle, gender, COUNT(*) count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY jobtitle, gender
ORDER BY jobtitle;

-- 7. What is the distribution of job titles across the company?
SELECT jobtitle, COUNT(*) count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY jobtitle
ORDER BY jobtitle;

-- 8. Which department has the highest turnover rate?
SELECT 
	department,
    total_count,
    terminated_count,
    terminated_count/total_count termination_rate
FROM (
	SELECT
		department,
        COUNT(*) total_count,
        SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= curdate() THEN 1 ELSE 0 END) terminated_count 
	FROM hr
    WHERE age >= 18 
    GROUP BY department
) subquery
ORDER BY termination_rate DESC;

-- 9. What is the distribution of employees across locations by city and state?
SELECT location_state, COUNT(*) count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY location_state
ORDER BY count DESC;

SELECT location_city, COUNT(*) count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY location_city
ORDER BY count DESC;

-- 10. How has the company's employee count changed over time based on hire and term dates?
SELECT
	year,
    hires,
    terminations,
    hires-terminations AS net_change,
    round((hires-terminations)/hires*100, 2) AS net_change_percent
FROM (
	SELECT
		YEAR(hire_date) year,
        COUNT(*) hires,
        SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= curdate() THEN 1 ELSE 0 END) terminations
	FROM hr
    WHERE age >= 18
    GROUP BY year
    ) subquery 
ORDER BY year ASC;

-- 11. What is the tenure distribution for each department?
SELECT department, round(avg(datediff(termdate, hire_date)/365),0) avg_tenure -- by year
FROM hr
WHERE termdate <> '0000-00-00' AND termdate <= curdate() AND age >= 18
GROUP BY department
ORDER BY avg_tenure DESC;