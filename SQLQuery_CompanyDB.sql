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
('Marketing', 'Dfofar');

INSERT INTO employees (name, salary, department_id, hire_date) VALUES
('Mohammed', 600, 1, '2022-05-18'),
('Salim', 750, 2, '2019-03-10'),
('Said', 650, NULL, '2021-06-25'),
('Azhar', 800, 3, '2018-07-30'),
('Talal', 900, 4, '2022-01-12');

INSERT INTO projects (project_name, department_id, budget) VALUES
('Project1', 1, 500),
('Project2', 2, 1200),
('Project3', 3, 7000),
('Project4', 4, 9500);
