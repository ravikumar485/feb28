--Nested table
-- 1 element



declare
type ty_number is table of number; -- declaration
 vty_number ty_number :=ty_number(1,2,3,4); -- intialization
begin
dbms_output.put_line(vty_number(1));
 --adding elememnt
 vty_number.extend(1);  -- 5 indexes
 vty_number(5):=10;
 dbms_output.put_line(vty_number(5));
end;
/



declare
type ty_number is table of number; -- declaration
 vty_number ty_number :=ty_number(1,2,3,4); -- intialization
begin
prc_debug(1);
prc_debug(2);
prc_debug(3);
prc_debug(4);
end;
/




declare
type ty_number is table of number; -- declaration
 vty_number ty_number :=ty_number(100,200,300,400); -- intialization
begin
prc_debug(vty_number.first); -- it will give fist index value
end;
/



declare
type ty_number is table of number; -- declaration
 vty_number ty_number :=ty_number(100,200,300,400); -- intialization
begin
prc_debug(vty_number.last); -- it will give last index value
end;
/



declare
type ty_number is table of number; -- declaration
 vty_number ty_number :=ty_number(100,200,300,400); -- intialization
begin
prc_debug(vty_number.last);  --4
vty_number.extend(10); -- it will increase 10 indexes
prc_debug(vty_number.last); 
end;
/


declare
type ty_number is table of number; -- declaration
 vty_number ty_number :=ty_number(100,200,300,400); -- intialization
begin
vty_number.extend(10); 
prc_debug(vty_number.count);
end;
/

-- extend
-- first
-- last
-- count


declare
type ty_number is table of number; -- declaration
 vty_number ty_number :=ty_number(100,200,300,400); -- intialization
begin
    vty_number.extend(10);   -- count 14, last index -14
    vty_number.delete(2); --count 13 , 
    prc_debug(' count ==> ' ||vty_number.count);
    prc_debug(' last index ==> ' ||vty_number.last);
end;
/


declare
type ty_number is table of number; -- declaration
 vty_number ty_number :=ty_number(100,200,300,400); -- intialization
begin
     prc_debug(vty_number(1));
     prc_debug(vty_number(2));
     prc_debug(vty_number(3));
     prc_debug(vty_number(4));
end;
/


declare
type ty_number is table of number; -- declaration
 vty_number ty_number :=ty_number(100,200,300,400); -- intialization
begin
     for i in vty_number.first ..vty_number.last  loop
        prc_debug(vty_number(i));
     end loop;
end;
/



declare
type ty_emp is table of emp%rowtype;
vemp ty_emp;
begin
    select  EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, TEMP, STATUS
        into vemp
    from emp;
end;
/

create or replace type ty_varchar is table of varchar2(10);  -- it can used in user level in any subprogram

declare
v_string ty_varchar:=ty_varchar('A', 'B', 'C');
begin
for i in v_string.first..v_string.last loop
    prc_debug(v_string(i));
end loop;
end;
/
 -- emp details 
 
declare
-- v_emp emp%rowtype;
 cursor cur_emp is select ename, empno, deptno from emp where empno=7369; 
 v_emp cur_emp%rowtype; 
begin
    open cur_emp; 
        loop
            exit when cur_emp%notfound;
                fetch cur_emp into v_emp;
                    prc_debug(v_emp.empno);
        end loop;
    close cur_emp;
end;
/

 -- bulk binding

declare
 cursor cur_emp is select * from emp ; 
 type ty_emp is table of cur_emp%rowtype;
 vty_emp ty_emp ;  -- since it's bullk collect  no need to init
begin
    open cur_emp;  --13 rows
        fetch cur_emp  bulk collect into vty_emp;  -- single time 
    close cur_emp;
    for i in vty_emp.first..vty_emp.last loop
            prc_debug(vty_emp(i).ename || '  '||vty_emp(i).empno || '  '|| vty_emp(i).deptno );
    end loop;    
end;
/


--task 
-- take all the emp's into custor
-- use bulk collect and load data into collection
-- update sal if comm is null to sal+10%                    -- while
-- delete dept whoever not exists in dept table 
-- commit;


