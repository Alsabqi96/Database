USE CompanyDB_New;

/*Left Joins*/

1-List All Departments and Their Employees
Write a query to list all department names along with their employees, ensuring that departments without employees are also included.
select d.department_name, e.name as employee_name from departments d left join employees e on d.department_id = e.department_id;

2-Find Projects Without Assigned Departments
Write a query to find all projects that do not have any associated department.
select p.project_name from projects p left join departments d on p.department_id = d.department_id where d.department_id is null;


3-List Departments Without Employees
Write a query to list departments that currently have no employees assigned.
select d.department_name from departments d left join employees e on d.department_id = e.department_id where e.department_id is null;


