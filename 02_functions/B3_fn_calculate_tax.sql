-- B3: Progressive monthly tax (PAYE-style brackets)
--   0 - 60,000        : 0%
--   60,001 - 100,000  : 20% of the part above 60,000
--   above 100,000     : 8,000 + 30% of the part above 100,000
CREATE OR REPLACE FUNCTION fn_calculate_tax(p_monthly_salary IN NUMBER)
RETURN NUMBER
IS
BEGIN
  IF p_monthly_salary IS NULL OR p_monthly_salary < 0 THEN
    RETURN NULL;
  ELSIF p_monthly_salary <= 60000 THEN
    RETURN 0;
  ELSIF p_monthly_salary <= 100000 THEN
    RETURN (p_monthly_salary - 60000) * 0.20;
  ELSE
    RETURN 8000 + (p_monthly_salary - 100000) * 0.30;
  END IF;
END fn_calculate_tax;
/
SHOW ERRORS FUNCTION fn_calculate_tax
