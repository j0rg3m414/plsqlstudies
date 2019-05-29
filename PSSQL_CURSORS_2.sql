set serveroutput on

declare
    cursor cur_emp is
        select first_name, salary
        from HR.employees;
begin
    for emp in cur_emp
    loop
        dbms_output.put_line(emp.first_name|| ' earns ' || emp.salary || ' per month.');
    end loop;
end;        