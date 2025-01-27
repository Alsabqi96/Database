USE CompanyDB_New;

/* Advanced Joins */

/* Find Employees Working in Departments Handling Projects With Budgets Greater Than 5000
Write a query to fetch the names of employees working in departments that have at least one project with a budget exceeding 5000. */
select distinct e.name as employee_name 
from employees e
inner join projects p
on e.department_id = p.department_id 
where p.budget > 5000;


/* Find Employees and Their Projects With Department Details
Write a query to fetch employee names, project names, department names, and department locations. */
select e.name as employee_name, p.project_name, d.department_name, d.location 
from employees e 
inner join departments d on e.department_id = d.department_id 
inner join projects p on d.department_id = p.department_id;


/* Find Total Budget Managed by Each Employee’s Department
Write a query to calculate the total budget of projects managed by each department and list the department name, location, and the employees working in it. */
select d.department_name, d.location, e.name as employee_name, sum(p.budget) as total_budget 
from employees e 
inner join departments d on e.department_id = d.department_id 
inner join projects p on d.department_id = p.department_id 
group by d.department_name, d.location, e.name;


/* Identify Departments With More Than 2 Employees
Write a query to find the names of departments that have more than two employees assigned. */

select * from departments;
select * from projects;
select d.department_name 
from departments d 
inner join employees e 
on d.department_id = e.department_id 
group by d.department_name 
having count(*) >= 2;

select * from employees




/* Employees in Shared Locations
Write a query to list employees working in departments that share the same location. */
select e.name as employee_name, d.department_name, d.location 
from employees e 
inner join departments d on e.department_id = d.department_id 
where d.location in (
    select location 
    from departments 
    group by location 
    having count(department_id) > 1
);




