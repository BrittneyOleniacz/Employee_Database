--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.first_name, e.last_name, e.gender, s.Salary 
from public."Employees" e
inner join public."Salaries" s on e.emp_no = s.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date
from public."Employees" e
where e.hire_date > '1986-01-01' and e.hire_date < '1986-12-31'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select ma.dep_no, dep.dep_name, e.emp_no, e.last_name, e.first_name
from public."Employees" e
inner join public."Managers" ma on e.emp_no = ma.emp_no
inner join public."Departments" dep on dep.dept_no = ma.dept_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, dep.dept_name
from public."Employees" e
inner join public."Dept_Emp" de on de.emp_no = e.emp_no 
inner join public."Departments" dep on de.dept_no = dep.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.gender
from public."Employees" e
where e.first_name = 'Hercules' and e.last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" e
inner join public."Dept_Emp" de on de.emp_no = e.emp_no
inner join public."Departments" d on d.dept_no = de.dept_no
where d.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employees" e
inner join public."Dept_Emp" de on de.emp_no = e.emp_no
inner join public."Departments" d on d.dept_no = de.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select e.last_name, 
count (e.last_name) as "Count" from public."Employees" e
group by e.last_name
order by "Count" desc

--Search for ID number: 499942
Select * from public."Employees"
where emp_no = 499942