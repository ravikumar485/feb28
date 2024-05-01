--nested table array
declare
type type_name is table of datatpye;
begin
end;
/

create or replace type type_name is table of datatype;

extend
first
last 
count 
delete

collection_varibale(idx):=
collection_varibale(idx)

bulk collect  into  
 
-- nested table is unbounded
------------------ varray bounded array
declare
type ty_varray is varray(3) of number;
vty_varray ty_varray := ty_varray(1,2,3);
begin
prc_debug(vty_varray.first);
prc_debug(vty_varray.last);
prc_debug(vty_varray.count); 
vty_varray.delete(2); 
end;
/



declare
type ty_varray is varray(3) of number;
vty_varray ty_varray := ty_varray(1,2,3);
begin
prc_debug(vty_varray.first);
prc_debug(vty_varray.last);
prc_debug(vty_varray.count); 
vty_varray.trim; 
prc_debug(vty_varray.first);
prc_debug(vty_varray.last);
prc_debug(vty_varray.count);
end;
/


declare
type varray_type is varray(5) of number;
v_varray_type varray_type:=varray_type(1,2, 3,4,5);
begin
    for i in v_varray_type.first..v_varray_type.last loop
        prc_debug(v_varray_type(i));
    end loop;
end;

create or replace type varray_ty is varray(5) of number;

select * from user_objects ;


declare
v_varray_type varray_ty:=varray_ty(1,2, 3,4,5);
begin
    for i in v_varray_type.first..v_varray_type.last loop
        prc_debug(v_varray_type(i));
    end loop;
end;


--we can create table varray in schema level
--------------------------------------------------

-- associated collection 
-- index based array

declare 
type ty_a is table of number(9) index by pls_integer; 
vty ty_a;
begin
vty(1) :=1;
end;
/



declare 
type ty_a is table of number(9) index by pls_integer; 
vty ty_a;
begin
vty(1) :=100;
vty(3) :=300;
vty(5) :=500;
vty(6) :=600;
    for i in vty.first ..vty.last loop -- i=2
        if vty.exists(i) then
            prc_debug(vty(i));
        end if;
    end loop;
end;
/



select * from emp;

declare
type ty_emp is table of emp%rowtype index by pls_integer;
vty_emp ty_emp;
begin
null;
end;


declare
type ty_emp is table of emp%rowtype index by pls_integer;
vty_emp ty_emp;
begin
    for i in (select * from emp)  loop -- 1st row
        vty_emp(i.empno) :=i;
    end loop;
    prc_debug(vty_emp(7369).ename);
--    for i in vty_emp.first..vty_emp.last loop
--            if vty_emp.exists(i) then
----            null;
--            prc_debug(vty_emp(i).empno);
--            end if;
--    end loop;
end;
/

-- we can't create associated  array in schema level
create or replace type type_associated_array is table of number(2) index by number;

 
Declare
type ty_emp is table of emp%rowtype index by pls_integer;
vty_emp ty_emp;
j number ;
begin
    for i in (select * from emp)  loop -- 1st row
        vty_emp(i.empno) :=i;
    end loop;
  
    j :=vty_emp.first; --7369
    while vty_emp.exists(j) loop            
            prc_debug(vty_emp(j).empno);
            j:=vty_emp.next(j); 
    end loop;
    
end;
/
























































