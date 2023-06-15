# HR - DATA ANALYSIS PROJECT

# Project overview
* This project explores the distribution of employees in a company.
* The distribution of employees is based on age, gender, race, job title, department, termination rate, work location, work duration, and place of origin. 
* The tools used in this project are MySQL and Tableau.

# Objectives:
## Questions that will drive the analysis:
1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by state?
10. How has the company's employee count changed over time based on hire and term dates?
11. What is the tenure distribution for each department?

# Cleaning and preparation:
We can see the raw dataset below, you can view the raw data at this **[LINK](https://github.com/al1fandi/HR_Project/blob/03a454e8a274b90ac5bce4176399c9bde9fdd867/table/raw_data_hr.csv)**. The date column did not display the appropriate format, so the dataset had to be cleaned and prepared for the analysis process.

![raw_capture](https://github.com/al1fandi/HR_Project/blob/main/image/raw_capture.png?raw=true)

## The activities performed were the following:
1. Change column name 
2. Update ‘birthdate’ column data format
3. Change data type for column ‘birthdate’
4. Update ‘hire_date’ column data format
5. Change data type for column ‘hire_date’
6. Add ‘age’ column
7. Add values to ‘age’ column

Clean dataset **[LINK](https://github.com/al1fandi/HR_Project/blob/4ce6676f441c097e2e675c256776c1505feb47bd/table/cleaned_data.csv)**

![clean_capture](https://github.com/al1fandi/HR_Project/blob/main/image/clean_capture.png?raw=true)

# Data analysis:
This analysis was conducted using MySQL and data visualization using Tableau considering the target questions.

### What is the gender breakdown of employees in the company?
![1](https://github.com/al1fandi/HR_Project/blob/main/image/1.png?raw=true)

### What is the race/ethnicity breakdown of employees in the company?
![2](https://github.com/al1fandi/HR_Project/blob/main/image/2.png?raw=true)

### What is the age distribution of employees in the company?
![3](https://github.com/al1fandi/HR_Project/blob/main/image/3.png?raw=true)

### How many employees work at headquarters versus remote locations?
![4](https://github.com/al1fandi/HR_Project/blob/main/image/4.png?raw=true)

### What is the average length of employment for employees who have been terminated?
![5](https://github.com/al1fandi/HR_Project/blob/main/image/5.png?raw=true)

### How does the gender distribution vary across departments and job titles?
![6](https://github.com/al1fandi/HR_Project/blob/main/image/6.png?raw=true)

### What is the distribution of job titles across the company?
![7](https://github.com/al1fandi/HR_Project/blob/main/image/7.png?raw=true)

### Which department has the highest turnover rate?
![8](https://github.com/al1fandi/HR_Project/blob/main/image/8.png?raw=true)

### What is the distribution of employees across locations by state?
![9](https://github.com/al1fandi/HR_Project/blob/main/image/9.png?raw=true)

### How has the company's employee count changed over time based on hire and term dates?
![10](https://github.com/al1fandi/HR_Project/blob/main/image/10.png?raw=true)

### What is the tenure distribution for each department?
![11](https://github.com/al1fandi/HR_Project/blob/main/image/11.png?raw=true)

# Visualization:
Finally came to the final part. I visualized the analysis results using Tableau Public. 

The sections that I displayed include:
1. Gender distribution
2. Age distribution
3. Termination rates
4. Employee turnover
5. Employee origin distribution
6. Work location distribution

You can see the dashboard below and you can access the document by clicking this **[LINK](https://public.tableau.com/shared/ZG5J378ND?:display_count=n&:origin=viz_share_link)**

![dashboard](https://github.com/al1fandi/HR_Project/blob/main/image/dashboard.png?raw=true)

# Conclusion
* There are more male employees, but the number of male and female employees does not differ much.
* The age range of most employees is 25-34.
* 74% of employees work in the head office, and some are remote.
* The average length of service for employees is 7 years.
* Out of a total of 14, there is only 1 department that has the most female employees, the rest are dominated by male.
* The job title 'Research Assistant II' has the highest number of employees. 
* Auditing is the department that has the most terminations.
* Many employees come from the state of Ohio.
* The percentage of employee changes decreased in 2003, 2005, 2006 and increased again until 2020.
* The longest average tenure in the Auditing department is 10 years.
* You can see the sql query in this **[LINK](https://github.com/al1fandi/HR_Project/tree/1e468d5d7b85ea2e370fdc9a8c39f997e17b63a5/query)
**
