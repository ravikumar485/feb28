create or replace function function_name (parameters)
return value
as
begin
return value;
exception
return value;
end;
;
/


create or replace function fn_gen_numbers
return boolean
as
begin
    for i in 1..100 loop
        dbms_output.put_line(i);
    end loop;
    return true;
    
end;
/



create or replace function fn_gen_numbers
return boolean
as
begin
    for i in 1..100 loop
        dbms_output.put_line(i);
    end loop;
    dbms_output.put_line('After Return value');
    return true;
   
end;




create or replace function fn_gen_numbers
return boolean
as
begin
    for i in 1..100 loop
        dbms_output.put_line(i);
    end loop;
    dbms_output.put_line('After Return value');
    return true;
   
end;






create or replace function fn_gen_numbers
return boolean
as
begin
    for i in 1..100 loop
        dbms_output.put_line(i);
    end loop;
    dbms_output.put_line('before Return value');
    return false;
    dbms_output.put_line('after Return value');
end;
/





-- comm -> comm+sal
-- comm is null then sal+100

create or replace function fn_new_sal(pempno number)
return number
as
v_sal number;
v_comm number;
v_new_sal number;
begin
select sal, comm 
        into v_sal, v_comm
            from emp where empno=pempno;
    if v_comm is null then 
        v_new_sal:= v_sal+100;
    else
        v_new_sal := v_sal+v_comm;
    end if;    
    return v_new_sal;
end;
/

create or replace function fn_new_sal_update (pempno number)
return number
as
v_sal number;
v_comm number;
v_new_sal number;
begin
select sal, comm 
        into v_sal, v_comm
            from emp where empno=pempno;
    if v_comm is null then 
        v_new_sal:= v_sal+100;
    else
        v_new_sal := v_sal+v_comm;
    end if;  
    
    update emp set sal=v_new_sal
    where empno=pempno;
    
    commit;
    
    return v_new_sal;
    
end;
/

--if dept-20
-- comm null ==> comm+100
-- comm not null ==>comm+sal
--else
--    comm = 1000


create or replace function fn_new_sal_mul_param (pempno number, 
                                                pout_new_sal out number ,
                                                pout_comm out number
                                                )
return boolean
as
v_sal number;
v_comm number;
v_deptno number;
begin
select sal, comm , deptno
        into v_sal, v_comm, v_deptno
            from emp where empno=pempno;        
        if v_deptno=20 then  
            if v_comm is null then 
                pout_new_sal:=v_sal+100;
            else
                pout_new_sal:=v_sal+v_comm;                
            end if;            
        else
            pout_comm:=1000;
        end if;
    return true;
end;
/

















