-- Query 1
-- List the following details of each employee: 
--	employee number, last name, first name, sex, and salary.

SELECT e.emp_no AS employee_number, 
	e.last_name AS employee_last_name,
	e.first_name AS employee_first_name,
	e.sex AS employee_gender,
	s.salary AS employee_salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- Query 2
-- List first name, last name, and hire date 
--	for employees who were hired in 1986.

SELECT first_name AS employee_first_name,
last_name AS employee_last_name,
hire_date AS employee_hire_date 
FROM employees
WHERE date_part('year', hire_date::date) = 1986;

-- Query 3
-- List the manager of each department with the following information: 
--	department number, department name, the manager's employee number, 
--	last name, first name.

SELECT departments.dept_no, departments.dept_name, 
	dept_manager.emp_no AS mgr_emp_no,
	e.last_name AS mgr_last_name,
	e.first_name AS mgr_first_name
FROM departments
JOIN dept_manager ON
dept_manager.dept_no = departments.dept_no
JOIN employees AS e ON
dept_manager.emp_no = e.emp_no;

-- Query 4
-- List the department of each employee with the following information: 
-- 	employee number, last name, first name, and department name.

SELECT e.emp_no,
e.last_name AS employee_last_name,
e.first_name AS employee_first_name,
departments.dept_name AS employee_dept_name
FROM employees AS e
JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
JOIN departments ON
dept_emp.dept_no= departments.dept_no;

--Create view to use in queries 6 & 7

CREATE VIEW emp_dept AS
SELECT e.emp_no,
e.last_name AS employee_last_name,
e.first_name AS employee_first_name,
departments.dept_name AS employee_dept_name
FROM employees AS e
JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
JOIN departments ON
dept_emp.dept_no= departments.dept_no;

--Query 5
-- List first name, last name, and sex for employees whose first name is "Hercules" 
--  and last names begin with "B."

SELECT first_name AS employee_first_name,
	last_name AS employee_last_name,
	sex AS employee_gender
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Query 6
-- List all employees in the Sales department, including their employee number, 
--	last name, first name, and department name.
--	Uses view created in Query 4

SELECT *
FROM emp_dept
WHERE employee_dept_name = 'Sales';

-- Query 7
-- List all employees in the Sales and Development departments, 
--	including their employee number, last name, first name, and department name.
--	Uses view created in Query 4

SELECT *
FROM emp_dept
WHERE employee_dept_name = 'Sales' OR employee_dept_name = 'Development';

-- Query 8
-- In descending order, list the frequency count of employee last names,
--	i.e., how many employees share each last name.

SELECT last_name AS Employee_Last_Name,
	COUNT(last_name) AS Count_of_Last_Name
FROM employees
GROUP BY Employee_Last_Name
ORDER BY Count_of_Last_Name DESC;