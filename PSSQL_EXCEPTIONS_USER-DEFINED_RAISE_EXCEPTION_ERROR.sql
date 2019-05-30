/*
The following PL/SQL program lists the employees who have joined the organization 
after the given date. The program must raise an exception if the date of joining 
is before the given date. The block uses RAISE_APPLICATION_ERROR to raise the 
exception with an error code 20005, and an appropriate error message appears on 
the screen:
*/

SET SERVEROUTPUT ON

DECLARE

    L_DOB_MON DATE := '01-DEC-1981';
    
    CURSOR C IS
        SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
        FROM HR.EMPLOYEES;
        
BEGIN
    FOR I IN C
    LOOP
        
        IF I.HIRE_DATE < L_DOB_MON THEN
            RAISE_APPLICATION_ERROR (-20005, 'Hiredate earlier than the given date!! Check for another employee');
        ELSE 
            DBMS_OUTPUT.PUT_LINE(i.FIRST_NAME || ' was hired on ' || i.HIRE_DATE);
        END IF;
    END LOOP;
END;