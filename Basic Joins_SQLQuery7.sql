USE CompanyDB_New;


/* Basic Joins */




/*Find Employee and Their Department Name
Write a query to fetch the employee's name along with their respective department name. */
select e.name as employee_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id;


/* List Projects and Their Department Locations
Write a query to list all projects with their department's location. */
select p.project_name, d.location 
from projects p, departments d
where p.department_id = d.department_id;


/* Find Employees Without Departments
Write a query to find employees who do not belong to any department. */
select name as employee_name
from  employees
where department_id is null;


/* List All Projects and Assigned Departments
Write a query to list each project name and the name of the department it is assigned to. Include projects that are not assigned to any department. */
select p.project_name, d.department_name
from projects p, departments d 
where p.department_id = d.department_id or p.department_id is null;
