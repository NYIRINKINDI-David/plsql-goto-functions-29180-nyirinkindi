-- Tests for B1-B4
SET SERVEROUTPUT ON
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- fn_annual_salary ---');
  DBMS_OUTPUT.PUT_LINE('101 (expect 10200000): ' || fn_annual_salary(101));
  DBMS_OUTPUT.PUT_LINE('999 (expect NULL)    : ' || NVL(TO_CHAR(fn_annual_salary(999)), 'NULL'));

  DBMS_OUTPUT.PUT_LINE('--- fn_years_of_service ---');
  DBMS_OUTPUT.PUT_LINE('101: ' || fn_years_of_service(101));
  DBMS_OUTPUT.PUT_LINE('999 (expect NULL): ' || NVL(TO_CHAR(fn_years_of_service(999)), 'NULL'));

  DBMS_OUTPUT.PUT_LINE('--- fn_calculate_tax ---');
  DBMS_OUTPUT.PUT_LINE('50000  (expect 0)    : ' || fn_calculate_tax(50000));
  DBMS_OUTPUT.PUT_LINE('80000  (expect 4000) : ' || fn_calculate_tax(80000));
  DBMS_OUTPUT.PUT_LINE('200000 (expect 38000): ' || fn_calculate_tax(200000));

  DBMS_OUTPUT.PUT_LINE('--- fn_dept_name ---');
  DBMS_OUTPUT.PUT_LINE('10 (expect Finance): ' || fn_dept_name(10));
  DBMS_OUTPUT.PUT_LINE('99 (expect Unknown): ' || fn_dept_name(99));
END;
/
