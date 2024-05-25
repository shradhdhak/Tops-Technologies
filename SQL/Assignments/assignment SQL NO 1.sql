-- 1. Display all information in the tables EMP and DEPT.    
select * from employees;
select * from departments;
 
-- 2. Display only the hire date and employee name for each employee.  
 select concat_ws(" ",first_name,last_name) as name , hire_date from employees;
 
-- 3.Display the ename concatenated with the job ID, separated by a comma and space, and 
    -- name the column Employee and Title 

SELECT  concat_ws(" ,",first_name,last_name,job_id)  AS Employees_Title
FROM employees;
  
-- 4. Display the hire date, name and department number for all clerks. 

SELECT hire_date, concat_ws(" ,",first_name,last_name) AS name, department_id
FROM employees;
  
-- 5. Create a query to display all the data from the EMP table. Separate each column by a 
-- comma. Name the column THE OUTPUT  
 
SELECT concat_ws(" ," ,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,department_id) as output
FROM employees;

-- 6. Display the names and salaries of all employees with a salary greater than 2000. 

SELECT concat_ws(" ,",first_name,last_name) , salary
FROM employees
WHERE salary > 2000;
  
-- 7. Display the names and dates of employees with the column headers "Name" and "Start 
-- Date"   

SELECT concat_ws(" ,",first_name,last_name) AS "Name",  "Start Date"
FROM employees;

-- 8. Display the names and hire dates of all employees in the order they were hired.

SELECT concat_ws(" ",first_name,last_name), hire_date
FROM employees
order by hire_date;   
   
-- 9. Display the names and salaries of all employees in reverse salary order.   

SELECT concat_ws(" ,",first_name,last_name), salary
FROM employees
ORDER BY salary DESC;

-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in 
-- reverse order.

SELECT concat_ws(" ",first_name,last_name), department_id
FROM employees
ORDER BY salary DESC;
   
-- 11. Display the last name and job title of all employees who do not have a manager   

SELECT  last_name, job_id from employees where manager_id is not null;

-- 12. Display the last name, job, and salary for all employees whose job is sales representative 
-- or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000

select last_name, job_id, salary from employees where (job_id = 'SA_REP' OR 'ST_CLERK') and salary not in  (2500, 3500, 5000);

-- 13) Display the maximum, minimum and average salary and commission earned.

SELECT MAX(salary) AS "Max Salary",
    MIN(salary) AS "Min Salary",
    AVG(salary) AS "Avg Salary",
    MAX(commission_pct) AS "Max Commission",
    MIN(commission_pct) AS "Min Commission",
    AVG(commission_pct) AS "Avg Commission"
FROM EMPloyees;
    
-- 14) Display the department number, total salary payout and total commission payout for 
-- each department.

SELECT department_id , sum(salary), avg(salary), max(commission_pct) from employees
GROUP BY department_id;

     
-- 15) Display the department number and number of employees in each department.

SELECT department_id AS "Department Number",
    COUNT(*) AS "Number of Employees"
FROM employees
GROUP BY department_id;
   
-- 16) Display the department number and total salary of employees in each department.

SELECT department_id AS " Department Number ",
    SUM(salary) AS "Total Salary"
FROM employees
GROUP BY department_id;
   
-- 17) Display the employee's name who doesn't earn a commission. Order the result set 
-- without using the column name   


SELECT concat_ws(" ",first_name,last_name)
FROM employees
WHERE commission_pct IS NULL
ORDER BY 1;

-- 18) Display the employees name, department id and commission. If an Employee doesn't  
-- earn the commission, then display as 'No commission'. Name the columns appropriately 


select concat_ws(" ", first_name, last_name) As employees_id, if(commission_pct is null, 'no commission_pct','commission') As commission from employees; 


-- 19) Display the employee's name, salary and commission multiplied by 2. If an Employee 
-- doesn't earn the commission, then display as 'No commission. Name the columns 
-- appropriately  


select concat(first_name," ",last_name) as  name,salary,if(commission_pct is null ,"no commission","commission") as 
Nocommission from employees
where commission_pct *2;
 


-- 20) Display the employee's name, department id who have the first name same as another 
-- employee in the same department  


select first_name , department_id from employees
 group by first_name , department_id;


-- 21) Display the sum of salaries of the employees working under each Manager.   


select department_id , sum(salary) , avg(salary) from employees
 group by department_id ;


-- 22) Select the Managers name, the count of employees working under and the department 
-- ID of the manager.   


select department_id , max(salary) from employees
group by department_id;

-- 23) Display the average of sum of the salaries and group the result with the department id. 
-- Order the result with the department id.   

select department_id , sum(salary) , avg(salary) from employees
 group by department_id ;



-- 24) Select the maximum salary of each department along with the department id   

select department_id , max(salary) from employees
group by department_id;



-- 25) Display the commission, if not null display 10% of salary, if null display a default value 1

SELECT first_name,department_id,
    CASE 
        WHEN commission_pct IS NOT NULL THEN commission_pct
        WHEN salary IS NOT NULL THEN salary * 0.1
        ELSE 1
    END AS commission_value
FROM employees;


-------------------------------------------------------------------------------------------------------------------

-- 26). Write a query that displays the employee's last names only from the string's 2-5th 
-- position with the first letter capitalized and all other letters lowercase, Give each column an 
-- appropriate label.    


SELECT concat(upper(substring(last_name,1,2)) , lower(substring(last_name,3,4))) AS "Formatted_Last_Name" FROM employees;

 
-- 27) Write a query that displays the employee's first name and last name along with a " in 
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
-- month on which the employee has joined.  


select concat(first_name," ",last_name) as name ,month(hire_date) as hire_month from employees;


-- 28) Write a query to display the employee's last name and if half of the salary is greater than 
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
-- 1500 each. Provide each column an appropriate label.   

select last_name,if(salary * 0.5  > 1000 , salary * 0.1 + 15000 ,salary * 0.115 + 1500) as totalsalary from employees;

 
-- 29) Write a query that displays the employee's last names with the first letter capitalized and 
-- all other letters lowercase, and the length of the names, for all employees whose name 
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
-- employees' last names   


select concat(upper(substring(last_name,1,1)),lower(substring(last_name,2))) as lastname ,length(last_name)  from employees
where last_name like "j%" or last_name like "A%" or last_name like "M%"
order by last_name;






-- 30) Create a query to display the last name and salary for all employees. Format the salary to 
-- be 15 characters long, left-padded with $. Label the column SALARY 

SELECT last_name,LPAD(salary, 15, '$') AS SALARY FROM employees;


-- 31) Display the employee's name if it is a palindrome   

select first_name from employees
where first_name = reverse(first_name);

-- 32) Display First names of all employees with initcaps.  

select concat(upper(substring(first_name,1,1)),lower(substring(first_name,2))) as firstname from employees;

 
-- 33) From LOCATIONS table, extract the word between first and second space from the 
-- STREET ADDRESS column.   

select concat(substring(street_address,1,1),substring(street_address,2,1)) as streetaddress from locations;


-- 34) Extract first letter from First Name column and append it with the Last Name. Also add 
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should 
-- be in lower case. Display this along with their First Name.   

use hr;
select concat(lower(substring(first_name,1,1)),last_name,"@systechusa.com") as email_address from employees;

-- 35) Display the names and job titles of all employees with the same job as Trenna.   




-- 36) Display the names and department name of all employees working in the same city as 
-- Trenna.   

use hr;
SELECT first_name, department_id
FROM employees 
WHERE city = (
    SELECT city 
    FROM employees 
    WHERE name = 'Trenna'
);


-- 37) Display the name of the employee whose salary is the lowest.   
use hr;
SELECT first_name
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);


-- 38) Display the names of all employees except the lowest paid.

use hr;
SELECT first_name,last_name
FROM employees
WHERE salary > (
    SELECT MIN(salary)
    FROM employees
);


-- 39) Write a query to display the last name, department number, department name for all 
-- employees.
use hr;
SELECT e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;



-- 40) Write a query to display the employee last name,department name,location id and city of 
-- all employees who earn commission. 
use hr;
SELECT e.last_name, d.department_name, d.location_id, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;
