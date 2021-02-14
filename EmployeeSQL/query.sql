-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no, last_name, first_name, sex, salary
FROM Employees INNER JOIN Salaries 
ON Employees.emp_no = Salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
-- Had to use TO_DATE function to return the correct values.

SELECT first_name, last_name, hire_date
FROM Employees 
WHERE TO_DATE(hire_date, 'MM/DD/YYYY')
BETWEEN TO_DATE('01/01/1986', 'MM/DD/YYYY') AND TO_DATE('12/31/1986','MM/DD/YYYY');

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT Departments.dept_no, dept_name, ManagerDepartments.emp_no, last_name, first_name
FROM ManagerDepartments INNER JOIN Departments
ON ManagerDepartments.dept_no = Departments.dept_no
INNER JOIN Employees
ON ManagerDepartments.emp_no = Employees.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT EmployeeDepartments.emp_no, last_name, first_name, dept_name
FROM EmployeeDepartments INNER JOIN Employees
ON EmployeeDepartments.emp_no = Employees.emp_no
INNER JOIN Departments 
ON EmployeeDepartments.dept_no = Departments.dept_no;

-- List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
SELECT EmployeeDepartments.emp_no, last_name, first_name, dept_name
FROM EmployeeDepartments 
INNER JOIN Employees
ON EmployeeDepartments.emp_no = Employees.emp_no
INNER JOIN DEPARTMENTS
ON EmployeeDepartments.dept_no = Departments.dept_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT EmployeeDepartments.emp_no, last_name, first_name, dept_name
FROM EmployeeDepartments 
INNER JOIN Employees
ON EmployeeDepartments.emp_no = Employees.emp_no
INNER JOIN DEPARTMENTS
ON EmployeeDepartments.dept_no = Departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(emp_no) AS "Total Employees"
FROM Employees
GROUP BY last_name
ORDER BY "Total Employees" DESC;