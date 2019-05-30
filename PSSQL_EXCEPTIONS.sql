set serveroutput on
declare
    l_name varchar2(100);
    l_sal number;
    l_empid number := 8376;
begin
    select first_name, salary 
    into l_name, l_sal 
    from HR.employees
    where employee_id = l_empid;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            /*Display an informative message*/
            dbms_output.put_line('Not found employee with the id ' || l_empid);
end;