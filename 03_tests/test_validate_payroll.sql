-- Tests for C1: fn_validate_payroll
SET LINESIZE 200
COLUMN emp_name FORMAT A18
COLUMN result FORMAT A50

SELECT emp_id, emp_name, status, monthly_salary,
       fn_validate_payroll(emp_id) AS result
FROM   employees
ORDER  BY emp_id;

SELECT 999 AS emp_id, fn_validate_payroll(999) AS result FROM dual;
