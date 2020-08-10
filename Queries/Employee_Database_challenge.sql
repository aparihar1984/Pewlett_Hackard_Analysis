-- Creating tables for Deliverable 1
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(40) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, title, from_date)
);

-- Checking to see if tables were imported properly.
SELECT * FROM departments;

-- DELIVERABLE 1 CODE

-- Retrieve the emp_no, first_name, and last_name columns from the Employees table
SELECT emp_no, first_name, last_name
FROM employees

-- Retrieve the titles, from_date, and to_date columns from the Titles table
SELECT title, from_date, to_date
FROM titles

-- All employees who were born between 1/1/1952 and 12/31/1955, this is for testing purposes.  Not part of actual deliveralble.
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
-- Check the table
SELECT * FROM retirement_info;

-- Joining employees and titles to ultimately give nicknames and retirement_titles table
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
    titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no;

-- Check the table
SELECT * FROM retirement_titles;

-- Now with nicknames
SELECT e.emp_no,
	e.first_name,
	e.last_name,
    ti.title,
	ti.from_date,
    ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Check the table
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Check the table/retrieve the number of titles from the Unique Titles table
SELECT * FROM unique_titles;

-- Retrieving the number of employees based on their most recent job title
SELECT COUNT(title),
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Check the table
SELECT * FROM retiring_titles;

-- DELIVERABLE 2 CODE

-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table
SELECT emp_no, first_name, last_name, birth_date
FROM employees

-- Retrieve the from_date, and to_date columns from the dept_emp table
SELECT from_date, to_date
FROM dept_emp

-- Retrieve the title columns from the Titles table
SELECT title
FROM titles

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date = '9999-01-01'
ORDER BY e.emp_no;

-- Check the new table
SELECT * FROM mentorship_eligibility;
