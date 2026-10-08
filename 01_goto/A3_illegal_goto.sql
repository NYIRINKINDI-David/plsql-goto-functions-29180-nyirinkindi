-- A3: Illegal GOTO and Fix
SET SERVEROUTPUT ON

-- PART 1: ILLEGAL. GOTO cannot jump INTO an IF block.
-- Expected: PLS-00375: illegal GOTO statement; this GOTO cannot branch to label 'INSIDE_IF'
BEGIN
  GOTO inside_if;
  IF 1 = 1 THEN
    <<inside_if>>
    DBMS_OUTPUT.PUT_LINE('Jumped into an IF block');
  END IF;
END;
/

-- PART 2: FIX. Put the label at the same block level (outside the IF), so the jump is legal.
BEGIN
  GOTO target_label;
  DBMS_OUTPUT.PUT_LINE('This line is skipped');
  <<target_label>>
  DBMS_OUTPUT.PUT_LINE('Fixed: label is in the same block, GOTO works');
END;
/
