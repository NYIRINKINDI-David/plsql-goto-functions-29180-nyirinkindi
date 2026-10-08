-- Setup: tables and sample data (run as PLSQL_USER)
SET SERVEROUTPUT ON

BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departments PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE departments (
  dept_id   NUMBER PRIMARY KEY,
  dept_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
  emp_id         NUMBER PRIMARY KEY,
  emp_name       VARCHAR2(60) NOT NULL,
  dept_id        NUMBER REFERENCES departments(dept_id),
  monthly_salary NUMBER(12,2),
  hire_date      DATE,
  status         VARCHAR2(10) DEFAULT 'ACTIVE'
);

INSERT INTO departments VALUES (10, 'Finance');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'Human Resources');

INSERT INTO employees VALUES (101, 'Alice Uwase',     10, 850000, DATE '2015-03-01', 'ACTIVE');
INSERT INTO employees VALUES (102, 'Brian Mugisha',   20, 450000, DATE '2019-07-15', 'ACTIVE');
INSERT INTO employees VALUES (103, 'Claire Ingabire', 30, 250000, DATE '2022-01-10', 'ACTIVE');
INSERT INTO employees VALUES (104, 'David Habimana',  20, 0,      DATE '2023-05-20', 'ACTIVE');
INSERT INTO employees VALUES (105, 'Eva Mukamana',    10, 600000, DATE '2018-09-01', 'INACTIVE');
INSERT INTO employees VALUES (106, 'Frank Niyonzima', NULL, 500000, DATE '2020-11-11', 'ACTIVE');
COMMIT;

SELECT * FROM employees;
