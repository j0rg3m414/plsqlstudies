SET SERVEROUTPUT ON
DECLARE

    CURSOR C_EMP IS
        SELECT EMPLOYEE_ID,SALARY
        FROM HR.EMPLOYEES;
    
        L_EMPNO HR.EMPLOYEES.EMPLOYEE_ID%TYPE;
        L_ENAME HR.EMPLOYEES.SALARY%TYPE;
        
BEGIN

    IF NOT C_EMP%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('*** Displaying Employee Information***');
    END IF;
    --FOR EMP IN CUR_EMP
    OPEN C_EMP;
    LOOP
    
    FETCH C_EMP INTO l_empno, l_ename;
    EXIT WHEN C_EMP%NOTFOUND;
    
        DBMS_OUTPUT.PUT_LINE(chr(10) || 'Display information ' || C_EMP%ROWCOUNT);
        DBMS_OUTPUT.PUT_LINE('Employee Id: ' || l_empno);
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || l_ename);
        
    END LOOP;
END;
