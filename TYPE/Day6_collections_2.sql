declare
type ty_empno is table of emp.empno%type;

vty_empno ty_empno:=ty_empno(); -- intializing
begin
     for i in (select empno from emp) loop -- 13 times 7369
            vty_empno.extend(1);            --index 1
             dbms_output.put_line(vty_empno.count());
            dbms_output.put_line(i.empno); --7369
--            vty_empno(i.empno):=i.empno;
--             vty_empno(7369) :=7369;
     end loop;
end;
/



declare
type ty_empno is table of emp.empno%type;
vty_empno ty_empno:=ty_empno(); -- intializing
begin
     for i in (select empno from emp) loop -- 13 times 7369
            vty_empno.extend(1);            --index 1
--            dbms_output.put_line(vty_empno.last);
            vty_empno(vty_empno.last) :=i.empno;
            dbms_output.put_line(vty_empno.last || ' == ' ||vty_empno(vty_empno.last));
    end loop;
end;
/
-- sql data types
-- +
--type, rowtype, pls_integer, boolean
--type ty_name is table of datatype(size)

--first 
--last
--count 
--extend
--delete
-- exists
-- sparse


-- varray
--   this is bounded collection

--first 
--last
--count 
--extend
--delete
-- limit
-- dense


declare
type ty_number is varray(3) of number;
v_ty_number ty_number:=ty_number();
begin
    v_ty_number.extend(3);
    v_ty_number(1):=10;    
    v_ty_number(2):=20;
    v_ty_number(3):=30;
    for i in 1..3 loop
        dbms_output.put_line(v_ty_number(i));
    end loop;    
end;
/


declare
type ty_number is varray(3) of number;
v_ty_number ty_number:=ty_number();
begin
    v_ty_number.extend(3);
    v_ty_number(1):=10;    
    v_ty_number(2):=20;
    v_ty_number(3):=30;
    for i in v_ty_number.first..v_ty_number.last loop
        dbms_output.put_line(v_ty_number(i));
    end loop;    
end;
/



declare
type ty_number is varray(3) of number;
v_ty_number ty_number:=ty_number();
begin
    v_ty_number.extend(3);
    v_ty_number(1):=10;    
    v_ty_number(2):=20;
    v_ty_number(3):=30;
        v_ty_number.delete(3);
    for i in v_ty_number.first..v_ty_number.last loop
        dbms_output.put_line(v_ty_number(i));
    end loop;    
end;
/




declare
type ty_number is varray(3) of number;
v_ty_number ty_number:=ty_number();
begin
    v_ty_number.extend(3);
    v_ty_number(1):=10;    
    v_ty_number(2):=20;
    v_ty_number(3):=30;
            --v_ty_number.delete(2);
    for i in v_ty_number.first..v_ty_number.last loop
        dbms_output.put_line(v_ty_number(i));
    end loop;    
end;
/
 -- we know rnage
 -- we know that values will not be changed 


declare
type ty_number is varray(3) of number;
v_ty_number ty_number:=ty_number();
begin
    dbms_output.put_line(v_ty_number.limit);
    v_ty_number.extend(3);
    v_ty_number(1):=10;    
    v_ty_number(2):=20;
    v_ty_number(3):=30;
            
    for i in v_ty_number.first..v_ty_number.last loop
        dbms_output.put_line(v_ty_number(i));
    end loop;    
end;
/



declare
type ty_emp is varray(3) of emp.empno%type;
v_ty_emp ty_emp:=ty_emp();
begin
    for i in (select * from emp) loop -- 13
        if v_ty_emp.limit<=v_ty_emp.last then 
            v_ty_emp.extend(1);
            v_ty_emp(v_ty_emp.last):=i.empno; 
        end if;
        dbms_output.put_line(v_ty_emp(v_ty_emp.last));
    end loop;    
end;
/





