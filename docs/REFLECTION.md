# Reflection (C2)

**Name:** NYIRINKINDI | **Student ID:** 29180

> Write this in YOUR OWN words after you have run everything. Replace each prompt below with 3-5 sentences.

## 1. What did I learn about GOTO?
(When does GOTO work, what is an illegal GOTO, and why did PLS-00375 appear in A3?)

= I learned that GOTO jumps to a label in the same block or an enclosing block. It cannot jump into an IF statement, loop, or nested block. This caused the PLS-00375 error in A3 because the jump was illegal.

## 2. GOTO vs structured code
(Compare A2 and A4. Which is easier to read and maintain? Why do most developers avoid GOTO?)

= A4 is easier to read, test, and maintain because the code follows a clear, logical order. GOTO can make the program flow confusing. That is why most developers prefer structured programming.

## 3. Functions
(Why use functions? What does a function return vs a procedure? How did exception handling help, e.g. NO_DATA_FOUND?)

=Functions are useful because they perform tasks and return values. Unlike procedures, functions must return a value and can be used in SQL queries. Exception handling, such as NO_DATA_FOUND, helps prevent errors by returning NULL or 'Unknown' when no data is found.

## 4. Functions in SQL
(What did B5 show? Why are functions inside SELECT useful, and what is the performance concern?)

= B5 showed how several functions can be used in one SELECT query. This is useful because it allows us to process data directly in SQL. However, performance can become slow when functions execute for every row in a large table.

## 5. Challenges and how I solved them
(Anything that failed, and what you did.)

= I faced challenges with the database listener not running and with the nested folder path. I worked on identifying the causes and correcting the configuration and path issues.
