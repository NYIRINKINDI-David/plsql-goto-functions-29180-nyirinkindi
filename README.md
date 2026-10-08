# PL/SQL GOTO Statements and Functions

- **Student:** NYIRINKINDI
- **Student ID:** 29180
- **Course:** Database Development with PL/SQL (INSY 8311)
- **Assignment:** Individual Assignment III

## Contents
| Folder | Description |
|---|---|
| `00_setup/` | Creates `departments` and `employees` tables with sample data |
| `01_goto/` | A1 number classifier, A2 salary review, A3 illegal GOTO and fix, A4 rewrite without GOTO |
| `02_functions/` | B1-B4 functions and C1 payroll validator |
| `03_tests/` | B5 functions in SELECT, function tests, payroll validator tests |
| `screenshots/` | Output screenshots for each task |
| `docs/REFLECTION.md` | C2 reflection |

## How to Run
Connect as the schema user (Oracle 21c XE, pluggable DB `XEPDB1`), then run in this order:

```sql
SET SERVEROUTPUT ON
@00_setup/create_tables.sql
@02_functions/B1_fn_annual_salary.sql
@02_functions/B2_fn_years_of_service.sql
@02_functions/B3_fn_calculate_tax.sql
@02_functions/B4_fn_dept_name.sql
@02_functions/C1_fn_validate_payroll.sql
@01_goto/A1_number_classifier.sql
@01_goto/A2_salary_review.sql
@01_goto/A3_illegal_goto.sql
@01_goto/A4_rewrite_no_goto.sql
@03_tests/test_functions.sql
@03_tests/B5_functions_in_select.sql
@03_tests/test_validate_payroll.sql
```

## Notes
- AI usage: I used an AI assistant (Claude) to help generate the initial code and guide me through setup and submission. I reviewed, ran, and tested every script myself and can explain how each one works.
