-- C1: Payroll validator. Returns 'VALID' or the first problem found.
-- Uses GOTO for the error exit and functions from Part B.
-- Run AFTER B3 and B4 (it depends on them).
CREATE OR REPLACE FUNCTION fn_validate_payroll(p_emp_id IN NUMBER)
RETURN VARCHAR2
IS
  v_emp    employees%ROWTYPE;
  v_msg    VARCHAR2(100);
BEGIN
  SELECT * INTO v_emp FROM employees WHERE emp_id = p_emp_id;

  IF v_emp.status <> 'ACTIVE' THEN
    v_msg := 'INVALID: employee is not active';
    GOTO invalid_exit;
  END IF;

  IF v_emp.monthly_salary IS NULL OR v_emp.monthly_salary <= 0 THEN
    v_msg := 'INVALID: salary must be greater than zero';
    GOTO invalid_exit;
  END IF;

  IF v_emp.dept_id IS NULL OR fn_dept_name(v_emp.dept_id) = 'Unknown' THEN
    v_msg := 'INVALID: employee has no valid department';
    GOTO invalid_exit;
  END IF;

  IF fn_calculate_tax(v_emp.monthly_salary) >= v_emp.monthly_salary THEN
    v_msg := 'INVALID: tax is not less than salary';
    GOTO invalid_exit;
  END IF;

  RETURN 'VALID';

  <<invalid_exit>>
  RETURN v_msg;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'INVALID: employee not found';
END fn_validate_payroll;
/
SHOW ERRORS FUNCTION fn_validate_payroll
