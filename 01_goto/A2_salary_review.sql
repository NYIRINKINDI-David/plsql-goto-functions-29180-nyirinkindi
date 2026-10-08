-- A2: Salary Review using GOTO
-- Rules: < 300,000 => Low; 300,000-700,000 => Standard; > 700,000 => High
SET SERVEROUTPUT ON
BEGIN
  FOR r IN (SELECT emp_id, emp_name, monthly_salary FROM employees ORDER BY emp_id) LOOP

    IF r.monthly_salary IS NULL THEN
      GOTO missing_salary;
    ELSIF r.monthly_salary < 300000 THEN
      GOTO low_band;
    ELSIF r.monthly_salary <= 700000 THEN
      GOTO standard_band;
    ELSE
      GOTO high_band;
    END IF;

    <<low_band>>
    DBMS_OUTPUT.PUT_LINE(r.emp_name || ' (' || r.monthly_salary || '): LOW band - recommend raise review');
    GOTO next_emp;

    <<standard_band>>
    DBMS_OUTPUT.PUT_LINE(r.emp_name || ' (' || r.monthly_salary || '): STANDARD band - no action');
    GOTO next_emp;

    <<high_band>>
    DBMS_OUTPUT.PUT_LINE(r.emp_name || ' (' || r.monthly_salary || '): HIGH band - check salary cap');
    GOTO next_emp;

    <<missing_salary>>
    DBMS_OUTPUT.PUT_LINE(r.emp_name || ': salary is missing');

    <<next_emp>>
    NULL;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Salary review complete.');
END;
/
