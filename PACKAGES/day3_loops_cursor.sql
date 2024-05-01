declare
x number :=10;
begin
    loop    
        if x>=10 then 
            dbms_output.put_line(X);
            exit;
        end if;
    end loop;
end;
/

declare
x number :=1;
begin
    loop 
        dbms_output.put_line(' OUTSIDE'|| X);
        if x>=10 then 
            dbms_output.put_line(X);
            exit;
        end if;
        X:=X+1;
    end loop;
end;
/

declare
x number :=1;
begin
    loop 
        EXIT WHEN X=10;
        dbms_output.put_line(x);
        X:=X+1;
    end loop;
end;
/


declare
x number :=1;
begin
     while x >=1  loop
        dbms_output.put_line( ' inseide ' || x);
        x:=x+1;
     end loop;
end;
/
--------------------------------------------------------

declare
begin
    for i in (select ename from emp) loop
        dbms_output.put_line(i.ename);
    end loop;
end;
/





declare
 cursor c is select ename from emp;
begin
    for i in c loop
        dbms_output.put_line(i.ename);
    end loop;
end;
/

--declare
--open cursor
--fetch cursor 
--close cursor

declare
 cursor cur is select * from emp where empno=7499;
 v_emp emp%rowtype;
begin
    open cur;
    fetch cur into v_emp;
    close cur;
end;
/

declare
 cursor cur is select * from emp where empno=7499;
 v_emp emp%rowtype;
begin
    open cur;
        fetch cur into v_emp;
    close cur;
    dbms_output.put_line(v_emp.ename);
end;
/


declare
 v_emp emp%rowtype;
 v_name varchar2(100);
begin
        select * into v_emp from emp ;
        dbms_output.put_line(v_emp.ename);
end;
/



declare
  v_name varchar2(100);
begin
        select ename into v_name from emp ;
        dbms_output.put_line(v_name);
end;
/


select  ename from emp;







