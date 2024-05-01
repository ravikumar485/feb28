declare
begin
exception
end;
/


begin

end;
/



sql ---
pls_integer
type
rowtype
boolean (true or flase)


declare
v_ename varchar2(100);
begin
v_ename :='AA';
dbms_output.put_line(V_ename);
end;
/


declare
v_ename varchar2(100);
begin
select ename  into v_ename
        from emp where empno='7369';
dbms_output.put_line(V_ename);
end;
/


select * from emp;


declare
v_ename varchar2(100);
begin
select ename  into v_ename
        from emp where empno='7369';
dbms_output.put_line(V_ename);
end;
/

insert into emp(empno, ename) values(1,'aa aa aa aa aa');

--increase column length

alter table emp modify ename varchar2(16)


insert into emp(empno, ename) values(1,'aa aa aa aa aa');


declare
v_ename varchar2(10);
begin
select ename  into v_ename
        from emp where empno='1';
dbms_output.put_line(V_ename);
end;
/


select  * from emp where empno=1;



declare
v_ename emp.ename%type;
begin
select ename  into v_ename
        from emp where empno='1';
dbms_output.put_line(V_ename);
end;
/


declare
v_ename emp.ename%type;
begin
select ename  into v_ename
        from emp where empno='1';
dbms_output.put_line(V_ename);
end;
/


select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO from emp;





declare
v_emp emp%rowtype;
begin
select empno,ename  into v_emp.empno,
                        v_emp.ename
        from emp where empno='7369';
dbms_output.put_line(v_emp.empno);
end;
/



declare
v_emp emp%rowtype;
begin
select *  into v_emp
        from emp where empno='7369';

dbms_output.put_line(v_emp.empno);
end;
/



        
declare
v_emp emp%rowtype; -- store only one row
begin
select *  into v_emp
        from emp ; --14 rows
dbms_output.put_line(v_emp.empno);
end;
/


-- collections in oracle 

nested table
associate array

varray

[];

declare
type ty_number is table of number; --nested table
vty_number ty_number := ty_number(10,20,30,40);
begin
dbms_output.put_line(vty_number(1));
dbms_output.put_line(vty_number(2));
dbms_output.put_line(vty_number(3));
dbms_output.put_line(vty_number(4));
end;
/


declare
type ty_number is table of number; --nested table
vty_number ty_number := ty_number(10,20,30,40);
begin
dbms_output.put_line(vty_number.count);
end;
/


declare
type ty_number is table of number; --nested table
vty_number ty_number := ty_number(10,20,30,40);
begin
dbms_output.put_line(vty_number.first);
end;
/





declare
type ty_number is table of number; --nested table
vty_number ty_number := ty_number(10,20,30,40);
begin
dbms_output.put_line(vty_number.last);
end;
/



declare
type ty_number is table of number; --nested table
vty_number ty_number := ty_number(10,20,30,40);
begin
vty_number.extend(1);

end;
/



declare
type ty_number is table of number;--nested table

vty_number ty_number := ty_number(10,20,30,40);
begin
vty_number.extend(1);
vty_number(5) :=50;

vty_number.extend(1);
vty_number(6) :=60;

    for i in vty_number.first..vty_number.last loop
        dbms_output.put_line(vty_number(i));
    end loop;
end;
/

--count, first, last, extend



declare
type ty_number is table of number; --nested table
vty_number ty_number := ty_number(10,20,30,40);
begin
vty_number.extend(1);
vty_number(5) :=50;
dbms_output.put_line(vty_number.last);
end;
/






declare
type ty_number is table of number;--nested table

vty_number ty_number := ty_number(10,20,30,40);
begin
vty_number.extend(1);
vty_number(5) :=50;

vty_number.extend(1);
vty_number(6) :=60;

vty_number.extend(2); --8

vty_number(7) :=70;
vty_number(8) :=80;

    for i in vty_number.first..vty_number.last loop
        dbms_output.put_line(vty_number(i));
    end loop;
end;
/




declare
type ty_number is table of number;--nested table
vty_number ty_number := ty_number(10,20,30,40); --4
begin
vty_number.extend(5); --9
vty_number(5) :=50;
vty_number(6) :=60;
vty_number(7) :=70;
vty_number(8) :=80;
        dbms_output.put_line(vty_number.last);
    for i in vty_number.first..vty_number.last loop
        dbms_output.put_line(vty_number(i));
    end loop;
end;
/



declare
type ty_number is table of number;--nested table
vty_number ty_number := ty_number(10,20,30,40); --4
begin
    for i in vty_number.first..vty_number.last loop
        dbms_output.put_line(vty_number(i));
    end loop;    
    vty_number(1) :=100;
    vty_number(2) :=200;
    vty_number(3) :=300;
    vty_number(4) :=400;
        dbms_output.put_line(' After changing the values');
    for i in vty_number.first..vty_number.last loop
        dbms_output.put_line(vty_number(i));
    end loop;
end;
/





declare
type ty_number is table of number;--nested table
vty_number ty_number := ty_number(10,20,30,40); --4
begin
    vty_number.delete(2);
    
    dbms_output.put_line(vty_number(1));
    dbms_output.put_line(vty_number(2));  
--    for i in vty_number.first..vty_number.last loop
--        dbms_output.put_line(vty_number(i));
--    end loop;    
end;
/





declare
type ty_number is table of number;--nested table
vty_number ty_number := ty_number(10,20,30,40); --4
begin
    vty_number.delete(2);
    for i in vty_number.first..vty_number.last loop
        if vty_number.exists(i) then 
            dbms_output.put_line(vty_number(i));
        end if;
    end loop; 
    dbms_output.put_line(vty_number.count);   
end;
/



count
first
last
exists
delete
extend



declare
type ty_chars is table of varchar2(1);
vty_chars ty_chars:=ty_chars(); -- 0
begin
    vty_chars(1):='A';
end;
/


declare
type ty_chars is table of varchar2(1);
vty_chars ty_chars:=ty_chars(); -- 0
begin
    vty_chars.extend(1);
    vty_chars(1):='A';
    
    dbms_output.put_line(vty_chars(1));
end;
/



declare
type ty_chars is table of varchar2(1);
vty_chars ty_chars:=ty_chars(); -- 0
begin
    vty_chars.extend(2); --1
    vty_chars(1):='A';
    vty_chars(2):='B';
    dbms_output.put_line(vty_chars(1));
end;
/





declare
type ty_number is table of number;
vty_number ty_number:=ty_number(); -- 0
begin
        for i in 1.. 100 loop
            vty_number.extend(1);
            vty_number(i) :=i;
        end loop;
end;
/


declare
type ty_empno is table of emp.empno%type;
vty_empno ty_empno:=ty_empno();
begin
     for i in (select empno from emp) loop
            vty_empno.extend(1);
            vty_empno(1):=i;
     end loop;
end;
/





declare
type ty_empno is table of emp.empno%type;
vty_empno ty_empno:=ty_empno();
begin
     for i in (select empno from emp) loop
            vty_empno.extend(1);
            vty_empno(1):=i.empno;
     end loop;
end;
/



declare
type ty_empno is table of emp.empno%type;
vty_empno ty_empno:=ty_empno();
begin
     for i in (select empno from emp) loop
            vty_empno.extend(1);
            vty_empno(i.empno):=i.empno;
     end loop;
end;
/