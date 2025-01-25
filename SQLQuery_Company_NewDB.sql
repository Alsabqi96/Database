CREATE DATABASE CompanyDB_New;
USE CompanyDB_New;

CREATE TABLE departments (
    department_id INT identity(1,1) PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT identity(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT,
    hire_date DATE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE projects (
    project_id INT identity(1,1) PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    department_id INT,
    budget DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


INSERT INTO departments (department_name, location) VALUES
('HR', 'Nizwa'),
('IT', 'Muscat'),
('Finance', 'Suhar'),
('Marketing', 'Dhofar');

INSERT INTO employees (name, salary, department_id, hire_date) VALUES
('Mohammed', 600, 1, '2022-05-18'),
('Salim', 750, 2, '2019-03-10'),
('Said', 650, NULL, '2021-06-25'),
('Azhar', 800, 3, '2018-07-30'),
('Talal', 900, 4, '2022-01-12');

INSERT INTO projects (project_name, department_id, budget) VALUES
('Project1', 1, 200000),
('Project2', 2, 1200),
('Project3', 3, 7000),
('Project4', 4, 9500);

1-Find all employees earning a salary higher than the average salary of all employees.
select name, salary from employees where salary > (select avg(salary) from employees);

2-List the names of employees working in departments located in 'Nizwa'.
select name from employees where department_id in (select department_id from departments where location = 'nizwa');

3-Find employees whose salaries are greater than the average salary of their respective department.
select name from employees where salary > (select avg(salary) from employees e2 where e2.department_id = employees.department_id);

4-Retrieve the names of employees who are not assigned to any department.    
select name from employees where department_id is null;

5-List the names of departments that do not have any associated projects.
select department_name from departments where department_id not in (select department_id from projects);

6-Identify the department name with the highest number of employees.
select department_name from departments where department_id = (select top 1 department_id from employees group by department_id order by count(*) desc);

7-List the names and salaries of the highest-paid employees in each department.
select name, salary, department_id from employees e1 where salary = (select max(salary) from employees e2 where e1.department_id = e2.department_id);

8-Find projects whose budgets exceed the total salaries of all employees in their respective departments.
select project_name from projects p where budget > (select sum(salary) from employees e where e.department_id = p.department_id);

9-Find the names of employees working in departments that manage projects with a budget greater than $200,000.
select name from employees where department_id in (select department_id from projects where budget > 200000);

10-List the names of employees who work in departments located in 'Muscat'.
select name from employees where department_id in (select department_id from departments where location = 'muscat');

11-Identify employees who earn more than the average salary across all departments.
select name from employees where salary > (select avg(salary) from employees);

12-Retrieve the name of the department that manages the project with the highest budget.
select department_name from departments where department_id = (select department_id from projects where budget = (select max(budget) from projects));

13-Display the department ID and the total number of employees in each department.
select department_id, count(*) as total_employees from employees group by department_id;

14-List employees who are in departments that do not have any projects.
select name from employees where department_id not in (select department_id from projects);

15-List the names of projects that have a budget higher than the average project budget.
select project_name from projects where budget > (select avg(budget) from projects);

16-Find the department IDs of departments that have fewer than three employees.
select department_id from employees group by department_id having count(*) < 3;

17-Find the name of the employee with the highest salary in the company.
select name from employees where salary = (select max(salary) from employees);

18-Find the names of departments that manage projects with a budget of less than $100,000.
select department_name from departments where department_id in (select department_id from projects where budget < 100000);

19-Identify the name and hire date of the most recently hired employee.
select name, hire_date from employees where hire_date = (select max(hire_date) from employees);



