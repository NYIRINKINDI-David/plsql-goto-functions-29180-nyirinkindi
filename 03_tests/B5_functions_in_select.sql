-- B5: Using the functions inside SELECT
SET LINESIZE 200
SET PAGESIZE 50
COLUMN emp_name FORMAT A18
COLUMN department FORMAT A16

SELECT emp_id,
       emp_name,
       fn_dept_name(dept_id)            AS department,
       monthly_salary,
       fn_annual_salary(emp_id)         AS annual_salary,
       fn_years_of_service(emp_id)      AS years_service,
       fn_calculate_tax(monthly_salary) AS monthly_tax
FROM   employees
ORDER  BY emp_id;
