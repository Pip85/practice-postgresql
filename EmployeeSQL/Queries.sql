-- Query 1
-- List the following details of each employee: 
--	employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

SELECT emp_no, last_name, first_name, sex, salary
FROM employees, 
(SELECT salary FROM salaries WHERE employees.emp_no = salaries.emp_no) AS Emp_Salary;

SELECT emp_no, last_name, first_name, sex, salary
FROM employees,
(SELECT salary from salaries WHERE emp_no = salaries.emp_no) AS Emp_Salary;
________________________________________________________________________________________

-- Query 2
-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees
WHERE date_part('year', hire_date::date) = 1986;

________________________________________________________________________________________

-- Query 3
-- List the manager of each department with the following information: 
--	department number, department name, the manager's employee number, last name, first name.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no AS mgr_emp_no,
	e.last_name AS mgr_last_name, e.first_name AS mgr_first_name
FROM departments
LEFT JOIN dept_manager ON
dept_manager.dept_no = departments.dept_no
LEFT JOIN employees AS e ON
dept_manager.emp_no = e.emp_no;

________________________________________________________________________________________

-- Query 4
-- List the department of each employee with the following information: 
-- 	employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees AS e
LEFT JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no = departments.dept_no;

________________________________________________________________________________________

--Query 5
-- List first name, last name, and sex for employees whose first name is "Hercules" 
--  and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

________________________________________________________________________________________

-- Query 6
-- List all employees in the Sales department, including their employee number, 
--	last name, first name, and department name.

SELECT emp_no, last_name, first_name, departments.dept_name
FROM employees
WHERE emp_no IN
	(SELECT emp_no FROM dept_emp
	 WHERE dept_no IN
		(SELECT dept_no FROM departments
		 WHERE dept_name = 'Sales'));
				

SELECT emp_no, last_name, first_name,
	(SELECT dept_name FROM departments
	  WHERE dept_name = 'Sales')
FROM employees
SELECT 
SELECT dept_no FROM departments WHERE dept_name = 'Sales'
SELECT dept_no FROM departments	
WHERE dept_name = 'Sales';


SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees AS e
LEFT JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

SELECT emp_no, last_name, first_name, dept_name
FROM employees, 

________________________________________________________________________________________

-- Query 7
-- List all employees in the Sales and Development departments, 
--	including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees AS e
LEFT JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

________________________________________________________________________________________

-- Query 8
-- In descending order, list the frequency count of employee last names,
--	i.e., how many employees share each last name.

SELECT last_name AS Employee_Last_Name, COUNT(last_name) AS Count_of_Last_Names
FROM employees
GROUP BY Employee_Last_Name
ORDER BY Count_of_Last_Names DESC;
