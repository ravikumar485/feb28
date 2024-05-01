declare
v_empno number (4);
v_ename varchar2(10);
begin
select empno, ename 
    into v_empno, v_ename 
        from emp where empno=7369;
        
dbms_output.put_line(' empno ==> '|| v_empno || ' ename ==> '|| v_ename);
end;
/
 -- 24C30A123
 -- D1
 -- D2
 
 
 declare
v_empno number (4);
v_ename varchar2(10);
v_deptno  number;
begin
select empno, ename, deptno
    into v_empno, v_ename , v_deptno
        from emp where empno=7369;
        
dbms_output.put_line(' empno ==> '|| v_empno || ' ename ==> '|| v_ename ||' deptno '|| v_deptno);
end;
/


select* from emp;

alter table emp modify deptno varchar2(5);

alter table emp rename  column deptno to temp;


select* from emp;

alter table emp add deptno varchar2(5);

select* from emp;

update emp set deptno ='D'|| temp;

select* from emp;


----------------------------------
 declare
v_empno number (4);
v_ename varchar2(10);
v_deptno  varchar2(10);
begin
select empno, ename, deptno
    into v_empno, v_ename , v_deptno
        from emp where empno=7369;
dbms_output.put_line(' empno ==> '|| v_empno || ' ename ==> '|| v_ename ||' deptno '|| v_deptno);
end;
/


 declare
v_empno number (4);
v_ename varchar2(10);
v_deptno  emp.deptno%type;
begin
select empno, ename, deptno
    into v_empno, v_ename , v_deptno
        from emp where empno=7369;
dbms_output.put_line(' empno ==> '|| v_empno || ' ename ==> '|| v_ename ||' deptno '|| v_deptno);
end;
/

select * from emp;


 declare
v_emp emp%rowtype;
begin
select *
    into v_emp
        from emp where empno=7369;
end;
/


 declare
v_emp emp%rowtype;
begin
select *
    into v_emp
        from emp where empno=7369;
dbms_output.put_line(v_emp.empno);
end;
/


declare
v_emp emp%rowtype; -- total emp  table structure -- 1.e 9 cols
begin
select ename, deptno
    into v_emp.ename, v_emp.deptno
        from emp where empno=7369;
        
dbms_output.put_line(v_emp.ename ||  '  '|| v_emp.deptno);
end;
/



declare
v_emp emp%rowtype; -- total emp  table structure -- 1.e 9 cols
begin
select *
    into v_emp
        from emp where empno=7369;
dbms_output.put_line(v_emp);
end;
/

-------------------------------------------------

--control statements
--if
-- case

declare
begin
exception
end;
/


declare
v_emp emp%rowtype; -- total emp  table structure -- 1.e 9 cols
begin
select *
    into v_emp
        from emp where empno=7369;
        
    if v_emp.deptno ='D20' THEN
        DBMS_OUTPUT.PUT_LINE(' This emp is eligible for 20% hike');
    end if;
end;
/


select * from emp;




declare
v_emp emp%rowtype; -- total emp  table structure -- 1.e 9 cols
begin
select *
    into v_emp
        from emp where empno=7499;
        
    if v_emp.deptno ='D20' THEN
        DBMS_OUTPUT.PUT_LINE(' This emp is eligible for 20% hike');
    end if;
end;
/



declare
v_emp emp%rowtype; -- total emp  table structure -- 1.e 9 cols
begin
select *
    into v_emp
        from emp where empno=7499;
    if v_emp.deptno ='D20' THEN
        DBMS_OUTPUT.PUT_LINE(' This emp is eligible for 20% hike');
    else
        DBMS_OUTPUT.PUT_LINE(' This emp is not eligible for hike');
    end if;
end;
/


select * from emp;

 -- nested if statement
declare
v_emp emp%rowtype; 
begin
select *
    into v_emp
        from emp where empno=7566;
    if v_emp.deptno ='D20' THEN
            if v_emp.sal<=1500 then
                DBMS_OUTPUT.PUT_LINE(' This emp is eligible for 20% hike');
            else
                DBMS_OUTPUT.PUT_LINE(' This emp is eligible for 10% hike');
            end if;
    else
        DBMS_OUTPUT.PUT_LINE(' This emp is not eligible for hike.');
    end if;
end;
/


-- loops
-- basic loop 
-- for loop
-- while loop

declare
x number :=10;
begin
    loop
        dbms_output.put_line(x);
        if x=10 then 
            exit;
        end if;
    end loop;
end;
/



declare
x number :=10;
begin
    loop
        dbms_output.put_line(x);
        if x<=15 then 
            exit;
        end if;
        x:= x+1;
    end loop;
end;
/

declare
x number :=10;
begin
    loop
        dbms_output.put_line(x);
        if x>=15 then 
            exit;
        end if;
        x:= x+1;
    end loop;
end;
/


declare
x number :=10;
begin
    loop
        dbms_output.put_line(x);
         exit when x<=15;        
        x:= x+1;
    end loop;
end;
/


declare
x number :=10;
begin
    loop
        dbms_output.put_line(x);
         exit when x<=15;        
        x:= x+1;
    end loop;
end;
/



declare
x number :=10;
begin
    FOR I IN 1..X LOOP 
        dbms_output.put_line(I);
    END LOOP;
end;
/


declare
x number :=10;
begin
    FOR I IN 1..X LOOP 
        if i<=5 then
            dbms_output.put_line(I);
        end if;
    END LOOP;
end;
/


select ename from emp;



begin
    for i in (select ename, deptno from emp) loop
        if i.deptno='D20' THEN
            dbms_output.put_line(i.ename);
        END IF;
    end loop;
end;
/


SMITH
JONES
SCOTT
ADAMS
FORD



BEGIN
FOR I IN REVERSE  1..100 LOOP
    DBMS_OUTPUT.PUT_LINE(I);
END LOOP;
END;
/


--------------------


--while 

    
declare
x number :=10;
begin
    while x<=10 loop
        dbms_output.put_line(x);
    end loop;
end;
/


declare
x number :=10;
begin
    while x<=10 loop
        dbms_output.put_line(x);
        x:=x+1;
    end loop;
end;
/


declare
x number :=10;
begin
    while x<=10 loop
        dbms_output.put_line(x);
        x:=x+1;
    end loop;
end;
/

--------------------------------------------------
--cursor  
--    implicit -- we don't have any control 
--    explicit
select * from emp;
insert
update

--explicit cursor
--cursor variable_name is select stmt
--declare
--open
--fetch 
--close


declare
cursor cur is select * from  emp; -- 13
v_emp emp%rowtype;
begin
    open cur;
        fetch cur into v_emp;
    close cur;
end;


declare
cursor cur is select * from  emp; -- 13
v_emp emp%rowtype;
begin
    open cur;
        fetch cur into v_emp;
    close cur;
    
    dbms_output.put_line(v_emp.empno); --7369
end;
/


declare
cursor cur is select * from  emp; -- 13
v_emp emp%rowtype;
begin
    open cur;
        loop
            exit when cur%notfound;
            fetch cur into v_emp;
        end loop;
    close cur;
    dbms_output.put_line(v_emp.empno); 
end;


select * from emp;




declare
cursor cur is select * from  emp; -- 13
v_emp emp%rowtype; -- it will hold 1 row
begin
    open cur;
        loop
            exit when cur%notfound;
            fetch cur into v_emp;
            dbms_output.put_line(v_emp.empno); 
        end loop;
    close cur;
end;

declare
cursor cur is select * from  emp; -- 13
v_emp emp%rowtype; -- it will hold 1 row
begin
    open cur; -- cursor area will store 1 billon
        loop
            exit when cur%notfound;
            fetch cur into v_emp;
            dbms_output.put_line(v_emp.empno); 
        end loop;   --5 min
    if not cur%isopen then
         open cur;
    end if;
    close cur;
    
end;
/

declare
cursor cur is select * from emp;
begin
    for i in cur loop
        dbms_output.put_line(i.deptno); 
    end loop;
end;
/

 d20 - 20%
    d20 -- less than 1500  20%
    d20 -- grater than 1500  10%

select * from emp;

declare
cursor cur is select * from emp; --13
begin
    for i in cur loop
        if i.deptno='D20' then 
            if i.sal<=1500 then
             update emp set sal=sal+(sal*0.20) where empno=i.empno;
            end if;
        end if;
    end loop;
end;
/

