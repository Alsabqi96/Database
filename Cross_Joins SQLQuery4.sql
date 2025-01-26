USE CompanyDB_New;

/*Cross Joins*/

1-Pair Employees With All Projects
Write a query to generate a list of all possible employee-project pairs.
select e.name as employee_name, p.project_name from employees e cross join projects p;

2-Generate a List of Department-Project Pairs
Write a query to pair each department with every project in the database.
select d.department_name, p.project_name from departments d cross join projects p;

