USE CompanyDB_New;

1-Find Employees in the IT Department
Write a query to fetch the names of employees working in the IT department.
select e.name as employee_name from employees e inner join departments d on e.department_id = d.department_id where d.department_name = 'IT';

2-List Employees Working on Projects
Write a query to list the names of employees who are part of a department that is assigned to any project.
select e.name as employee_name from employees e inner join projects p on e.department_id = p.department_id;

3-Find Employees and Their Projects
Write a query to fetch employees along with project names they are indirectly associated with (based on their department).
select e.name as employee_name, p.project_name from employees e inner join projects p on e.department_id = p.department_id;

