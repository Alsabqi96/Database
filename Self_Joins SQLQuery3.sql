USE CompanyDB_New;

/*Self Joins*/

1-Find Employees Hired After Their Colleagues in the Same Department
Write a query to list employees who were hired after at least one of their colleagues in the same department.
select e1.name as employee_name, e2.name as colleague_name, e1.hire_date from employees e1 inner join employees e2 on e1.department_id = e2.department_id where e1.hire_date > e2.hire_date;

2-List Employees With the Same Salary in the Same Department
Write a query to find employees within the same department who have the same salary.
select e1.name as employee_name, e2.name as colleague_name, e1.salary, e1.department_id from employees e1 inner join employees e2 on e1.department_id = e2.department_id and e1.salary = e2.salary and e1.employee_id != e2.employee_id;

