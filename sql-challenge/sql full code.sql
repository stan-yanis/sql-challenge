-- 1. Employee #,name, sex, salary(from salaries table)

select Employees.Emp_no,
		Employees.last_name,
		Employees.first_name,
		Employees.sex,
		Salaries.salary
		
from employees
inner join salaries on 
	employees.emp_no = salaries.emp_no;
	
-- 2. Employee name who were hire in 1986	

select first_name,
		last_name,
		hire_date
		
from employees
where extract(year from hire_date) = 1986;

-- 3. Manager names W/ dept#, dept name, and emp#

select Department_manager.dept_no,
		Departments.dept_name,
		Department_manager.emp_no,
		Employees.first_name,
		Employees.last_name
		
		
from Department_manager

inner join Departments on
	Department_manager.dept_no = Departments.dept_no
	
inner join Employees on
	Department_manager.emp_no = employees.emp_no
	
--#4 employees name W/ dept#, emp#,dept name 	

select Department_employees.dept_no,
		Department_employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Departments.dept_name
		
from Department_employees

inner join Employees on
	Department_employees.emp_no = Employees.emp_no
	
inner join Departments on
	Department_employees.dept_no = Departments.dept_no
	
--#5 Employees name whose first name = Hercules and last name begins B and their sex

select first_name,
		last_name,
		sex
from Employees
where first_name = 'Hercules'
	and last_name like 'B%'
	
--#6 Employee in Sales department w/ emp#

select employees.emp_no,
		employees.last_name,
		employees.first_name
		
from employees
inner join Department_employees on
	employees.emp_no = Department_employees.emp_no
inner join departments on
	Departments.dept_no = Department_employees.dept_no
where departments.dept_name = 'Sales'

--#7 Employee in Sales and Development with emp# and dept

select Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		departments.dept_name
		
from Employees
inner join Department_employees on
	Employees.emp_no = Department_employees.emp_no
inner join departments on
	departments.dept_no = Department_employees.dept_no
where departments.dept_name in ('Sales', 'Development')

--#8 frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name,
		count(last_name)
from employees
group by last_name
order by count(last_name) desc


	