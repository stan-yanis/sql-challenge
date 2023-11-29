-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Department_employees;
DROP TABLE IF EXISTS Department_manager;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Titles;


CREATE TABLE Departments (
    Dept_no varchar   NOT NULL,
    Dept_name varchar   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_no
     )
);

CREATE TABLE Titles (
    Title_id varchar   NOT NULL,
    Title varchar   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        Title_id
     )
);

CREATE TABLE Employees (
    Emp_no int   NOT NULL,
    Emp_title_id varchar   NOT NULL,
    Birth_date date   NOT NULL,
    First_name varchar   NOT NULL,
    Last_name varchar   NOT NULL,
    Sex varchar   NOT NULL,
    Hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_no
     )
);

CREATE TABLE Department_employees (
    Emp_no int   NOT NULL,
    Dept_no varchar   NOT NULL
);

CREATE TABLE Department_manager (
    Dept_no varchar   NOT NULL,
    Emp_no int   NOT NULL
);



CREATE TABLE Salaries (
    Emp_no int   NOT NULL,
    Salary int   NOT NULL
);



ALTER TABLE Department_employees ADD CONSTRAINT fk_Department_employees_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Department_employees ADD CONSTRAINT fk_Department_employees_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);

ALTER TABLE Department_manager ADD CONSTRAINT fk_Department_manager_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);

ALTER TABLE Department_manager ADD CONSTRAINT fk_Department_manager_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_Title_id FOREIGN KEY(Title_id)
REFERENCES Employees (Emp_title_id);

