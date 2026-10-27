Exercise 1: Employees and Department Budgets
SELECT 
    e.name AS employee_name,
    e.department AS department_name,
    e.salary,
    d.budget AS department_budget
FROM employees e
JOIN departments d 
    ON e.department = d.name;

Exercise 2: Employees and Their Managers
SELECT 
    e.name AS employee_name,
    m.name AS manager_name
FROM employees e
LEFT JOIN employees m 
    ON e.manager_id = m.id;

Exercise 3: Employee Count by Department
SELECT 
    department,
    COUNT(id) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC;

or 

SELECT 
    d.name AS department_name,
    COUNT(e.id) AS employee_count
FROM departments d
LEFT JOIN employees e 
    ON d.name = e.department
GROUP BY d.name
ORDER BY employee_count DESC;


  
Exercise 4: Average Salary by Department
SELECT 
    department,
    ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;



Exercise 5: Salary Summary by Department

SELECT 
    department,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    SUM(salary) AS total_salary,
    COUNT(id) AS employee_count
FROM employees
GROUP BY department;

Exercise 6: Departments with More Than Two Employees

  SELECT 
    department,
    COUNT(id) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(id) > 2
ORDER BY employee_count DESC;



Exercise 7: Department Budget and Salary Comparison

SELECT 
    d.name AS department_name,
    d.budget,
    SUM(e.salary) AS total_salary,
    (d.budget - SUM(e.salary)) AS budget_difference
FROM departments d
JOIN employees e 
    ON d.name = e.department
GROUP BY d.name, d.budget;
