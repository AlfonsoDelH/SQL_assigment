--List the following details of each employee: employee number, last name, first name, gender, and salary.

select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees
left join salaries 
on employees.emp_no= salaries.emp_no

--List employees who were hired in 1986

select emp_no,first_name,last_name
from employees
where hire_date between '1989-01-01' and '1989-12-31'

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.

select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
from departments
left join dept_manager 
on departments.dept_no = dept_manager.dept_no
left join employees 
on  employees.emp_no = dept_manager.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, employees.last_name, departments.dept_name
from employees
left join dep_emp 
on employees.emp_no = dep_emp.emp_no
left join departments 
on  departments.dept_no = dep_emp.dept_no

--List all employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name
from employees
where first_name = 'Hercules'
AND left(last_name,1)='B'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
left join dep_emp 
on employees.emp_no = dep_emp.emp_no
left join departments 
on  departments.dept_no = dep_emp.dept_no
where dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
left join dep_emp 
on employees.emp_no = dep_emp.emp_no
left join departments 
on  departments.dept_no = dep_emp.dept_no
where dept_name in ('Sales','Development') 

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc