-- A1: Number Classifier using GOTO
SET SERVEROUTPUT ON
DECLARE
  v_nums SYS.ODCINUMBERLIST := SYS.ODCINUMBERLIST(-7, 0, 15, 8);
  v_n    NUMBER;
BEGIN
  FOR i IN 1 .. v_nums.COUNT LOOP
    v_n := v_nums(i);

    IF v_n > 0 THEN
      GOTO positive_num;
    ELSIF v_n < 0 THEN
      GOTO negative_num;
    ELSE
      GOTO zero_num;
    END IF;

    <<positive_num>>
    IF MOD(v_n, 2) = 0 THEN
      DBMS_OUTPUT.PUT_LINE(v_n || ' is POSITIVE and EVEN');
    ELSE
      DBMS_OUTPUT.PUT_LINE(v_n || ' is POSITIVE and ODD');
    END IF;
    GOTO next_num;

    <<negative_num>>
    DBMS_OUTPUT.PUT_LINE(v_n || ' is NEGATIVE');
    GOTO next_num;

    <<zero_num>>
    DBMS_OUTPUT.PUT_LINE(v_n || ' is ZERO');

    <<next_num>>
    NULL;
  END LOOP;
END;
/
