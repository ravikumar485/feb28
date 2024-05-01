
create procedure prc_print_number
as
begin
for i in 1..100 loop
    dbms_output.put_line(i);
end loop;
end;
/




create or replace procedure prc_print_number (pnumber number)
as
begin
for i in 1..pnumber loop
    dbms_output.put_line(i);
end loop;
end;
/






create or replace procedure prc_print_even_numbers (pnumber number)
as
begin
    for i in 1..pnumber loop
        if mod(i,2) =0 then
                dbms_output.put_line(i);
        end if;
    end loop;
end;
/



create or replace procedure prc_print_even_numbers (pnumber number default 100)
as
begin
    for i in 1..pnumber loop
        if mod(i,2) =0 then
                dbms_output.put_line(i);
        end if;
    end loop;
end;
/


create or replace procedure prc_emp(pempno number)
as
v_ename varchar2(100);
begin
select ename  into v_ename
        from emp where empno=pempno;
        
dbms_output.put_line(v_ename);
end;
/



create or replace procedure prc_emp(pempno number, pdeptno number)
as
v_ename varchar2(100);
begin
select ename  into v_ename
        from emp where empno=pempno and deptno=pdeptno;
        
dbms_output.put_line(v_ename);
end;
/



-- if  comm is null then  update sal to sal=sal+100
--if comm not null  then sal=sal+comm
create or replace procedure prc_emp_dml(pempno number)
as
v_sal number;
v_comm number;
begin
    select sal, comm 
        into v_sal, v_comm
     from emp where empno=pempno;
        if v_comm is null then
            update emp set sal=sal+100 where empno=pempno;
        else
            update emp set sal=sal+comm where empno=pempno;
        end if;
    commit;
end;
/





create or replace procedure prc_emp_dml(pempno number)
as
v_sal number;
v_comm number;
v_new_sal number;
begin
    select sal, comm 
        into v_sal, v_comm
     from emp where empno=pempno;
        if v_comm is null then
            v_new_sal :=v_sal+100;
        else
            v_new_sal :=v_sal+v_comm;
        end if;
        
        update emp set sal=v_new_sal where empno=pempno;
    commit;
end;
/



create or replace procedure prc_emp_dml(pempno in number, pnew_sal  out number )
as
v_sal number;
v_comm number;
v_new_sal number;
begin
    select sal, comm 
        into v_sal, v_comm
     from emp where empno=pempno;
        if v_comm is null then
            v_new_sal :=v_sal+100;
        else
            v_new_sal :=v_sal+v_comm;
        end if;
        
        update emp set sal=v_new_sal where empno=pempno;
    commit;
    
    pnew_sal:=v_new_sal;
end;
/



create or replace procedure prc_emp_dml(pnumber in out number )
as
v_sal number;
v_comm number;
v_new_sal number;
begin
    select sal, comm 
        into v_sal, v_comm
     from emp where empno=pnumber;
     
        if v_comm is null then
            v_new_sal :=v_sal+100;
        else
            v_new_sal :=v_sal+v_comm;
        end if;
        
        update emp set sal=v_new_sal where empno=pnumber;
    commit;
    pnumber:=v_new_sal;
end;
/




-- in  == can't assing values
-- out  we can assign value
-- in out we can assign value
-- default
-- dml - yes


create or replace procedure prc_emp_dml(pnumber in out number )
as
v_sal number;
v_comm number;
v_new_sal number;
begin
    select sal, comm 
        into v_sal, v_comm
     from emp where empno=pnumber;
        
        if v_comm is null then
        return ; 
--            v_new_sal :=v_sal+100;
        else
            v_new_sal :=v_sal+v_comm;
        end if;
        
        update emp set sal=v_new_sal where empno=pnumber;
    commit;
    pnumber:=v_new_sal;
end;
/









select * from user_objects;