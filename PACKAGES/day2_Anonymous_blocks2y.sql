declare
v_empno emp.empno%type :=7499;
v_emp emp%rowtype;
v_total_sal number;
begin
    select sal, comm 
            into v_emp.sal, v_emp.comm
        from emp where empno=v_empno;
    
    if v_emp.comm is not null  then
        v_total_sal :=v_emp.sal+ v_emp.comm;
    end if;
    
        dbms_output.put_line( v_total_sal);
end;
/



declare
v_empno emp.empno%type :=7369;
v_emp emp%rowtype;
v_total_sal number :=0;
begin
    select sal, comm 
            into v_emp.sal, v_emp.comm
        from emp where empno=v_empno;
    
    if v_emp.comm is not null  then
        v_total_sal :=v_emp.sal+ v_emp.comm;
    end if;
    
        dbms_output.put_line( v_total_sal);
end;
/

declare
v_empno emp.empno%type :=7369;
v_emp emp%rowtype;
v_total_sal number :=0;
begin
    select sal, comm 
            into v_emp.sal, v_emp.comm
        from emp where empno=v_empno;
    
        dbms_output.put_line('Sal ==>'||v_emp.sal );
        dbms_output.put_line(' comm ==>'||v_emp.comm );

    if v_emp.comm is not null  then
        dbms_output.put_line( ' Inside if block');
        v_total_sal :=v_emp.sal+ v_emp.comm;
    else
        dbms_output.put_line( ' Inside else block');
        v_total_sal :=v_emp.sal+ (v_emp.sal*0.1); -- 10 percent hike
    end if;
    
    dbms_output.put_line( v_total_sal);
        
end;
/





--comm is not null then comm + sal
--comm is null , deptno 20  --10 %

declare
v_empno emp.empno%type :=&empno;
v_emp emp%rowtype;
v_total_sal number :=0;
begin
    select sal, comm, deptno 
            into v_emp.sal, v_emp.comm, v_emp.deptno
        from emp where empno=v_empno;

    if v_emp.comm is not null  then
        dbms_output.put_line( ' Inside if block');
        v_total_sal :=v_emp.sal+ v_emp.comm;
    else
        if v_emp.deptno=20 then
            dbms_output.put_line(' This emp is eligible for 10% hike');
            v_total_sal :=v_emp.sal+ (v_emp.sal*0.1); -- 10 percent hike
        end if;
    end if;    
    dbms_output.put_line( v_total_sal);
end;
/



declare
begin
    for i in 1.. 10 loop
        dbms_output.put_line(i);
    end loop;
end;
/

--for  variable in startvalue.. endvalue loop
--    operations
--    end loop;



declare
begin
    for i in reverse 1..10  loop
        dbms_output.put_line(i);
    end loop;
end;
/




declare
begin
    for i in (select ename from emp) loop
            dbms_output.put_line(i.ename);
    end loop;
end;
/


declare
begin
    for i in (select empno, ename from emp) loop
            dbms_output.put_line(i.empno || ' '|| i.ename);
    end loop;
end;
/

declare
begin
    for cur in (select empno, ename from emp) loop
            dbms_output.put_line(cur.empno || ' '|| cur.ename);
    end loop;
                
end;
/

--deptno 10,30
-- comm is not null then sal + comm
-- comm is null then new sal= sal+ 10% hike

declare
v_new_sal number;
begin
    for i in (select * from emp) loop
        --if i.deptno=10 or i.deptno =30 
        v_new_sal :=0;
        if i.deptno in (10,30)  then
            if i.comm is not null then
                v_new_sal:=i.sal+i.comm;
            else
                v_new_sal :=i.sal+ (i.sal*0.1);
            end if;
        end if;
        
        dbms_output.put_line('empno ==>'||i.empno
                             ||' Sal ==>' || i.sal
                             ||' comm ==>' || i.comm
                             ||' deptno ==>' || i.deptno
                             ||' new sal ==>' || v_new_sal);
                             
    end loop;
end;
/





--select * from emp;
