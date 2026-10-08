-- A4: Salary Review (A2) rewritten WITHOUT GOTO using IF / ELSIF
SET SERVEROUTPUT ON
BEGIN
  FOR r IN (SELECT emp_id, emp_name, monthly_salary FROM employees ORDER BY emp_id) LOOP
    IF r.monthly_salary IS NULL THEN
      DBMS_OUTPUT.PUT_LINE(r.emp_name || ': salary is missing');
    ELSIF r.monthly_salary < 300000 THEN
      DBMS_OUTPUT.PUT_LINE(r.emp_name || ' (' || r.monthly_salary || '): LOW band - recommend raise review');
    ELSIF r.monthly_salary <= 700000 THEN
      DBMS_OUTPUT.PUT_LINE(r.emp_name || ' (' || r.monthly_salary || '): STANDARD band - no action');
    ELSE
      DBMS_OUTPUT.PUT_LINE(r.emp_name || ' (' || r.monthly_salary || '): HIGH band - check salary cap');
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Salary review complete.');
END;
/
