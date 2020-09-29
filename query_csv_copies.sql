--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
copy (select e.emp_no, e.first_name, e.last_name, e.gender, s.Salary from public."Employees" e
inner join public."Salaries" s on e.emp_no = s.emp_no) to E'C:\\Program Files\\PostgreSQL\\13\\data\\query1_results.csv' with csv header
   
--2. List first name, last name, and hire date for employees who were hired in 1986.
copy (select e.first_name, e.last_name, e.hire_date from public."Employees" e
where e.hire_date > '1986-01-01' and e.hire_date < '1986-12-31') to E'C:\\Program Files\\PostgreSQL\\13\\data\\query2_results.csv' with csv header

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
copy (select ma.dept_no, dep.dept_name, e.emp_no, e.last_name, e.first_name
from public."Employees" e
inner join public."Managers" ma on e.emp_no = ma.emp_no
inner join public."Departments" dep on dep.dept_no = ma.dept_no) to E'C:\\Program Files\\PostgreSQL\\13\\data\\query3_results.csv' with csv header

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
copy (select e.emp_no, e.last_name, e.first_name, dep.dept_name
from public."Employees" e
inner join public."Dept_Emp" de on de.emp_no = e.emp_no 
inner join public."Departments" dep on de.dept_no = dep.dept_no) to E'C:\\Program Files\\PostgreSQL\\13\\data\\query4_results.csv' with csv header

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
copy (select e.first_name, e.last_name, e.gender
from public."Employees" e
where e.first_name = 'Hercules' and e.last_name like 'B%') to E'C:\\Program Files\\PostgreSQL\\13\\data\\query5_results.csv' with csv header

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
copy (select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" e
inner join public."Dept_Emp" de on de.emp_no = e.emp_no
inner join public."Departments" d on d.dept_no = de.dept_no
where d.dept_name = 'Sales') to E'C:\\Program Files\\PostgreSQL\\13\\data\\query6_results.csv' with csv header

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
copy (select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" e
inner join public."Dept_Emp" de on de.emp_no = e.emp_no
inner join public."Departments" d on d.dept_no = de.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development') to E'C:\\Program Files\\PostgreSQL\\13\\data\\query7_results.csv' with csv header

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
copy (select e.last_name, 
count (e.last_name) as "Count" from public."Employees" e
group by e.last_name
order by "Count" desc) to E'C:\\Program Files\\PostgreSQL\\13\\data\\query8_results.csv' with csv header

--Search for ID number: 499942
copy (Select * from public."Employees"
where emp_no = 499942) to E'C:\\Program Files\\PostgreSQL\\13\\data\\ID499942_results.csv' with csv header


--Sources--
--https://stackoverflow.com/questions/8119297/postgresql-export-resulting-data-from-sql-query-to-excel-csv