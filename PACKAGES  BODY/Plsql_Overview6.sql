--how to call procedure from another ptocedure

create or replace procedure prc_debug(str varchar2)
as
begin
dbms_output.put_line(str);
end;
/



create or replace procedure prc_get_ename (pempno number)
as
v_ename varchar2(100);
begin
select ename into v_ename
    from emp where empno=pempno;
PRC_DEBUG(v_ename);
end;
/



DECLARE
  PEMPNO NUMBER;
BEGIN
  PEMPNO := 7369;
  PRC_GET_ENAME(PEMPNO => PEMPNO  );
END;

------------------------------------------
-- functions

create or replace procedure procedure_name(parameters)
as 
begin
exception
end;
/



create or replace function function_name(parameters)
return datatype
as 
begin
    return value;
exception
    return value;
end;
/

create or replace function fn_get_ename (pempno number)
return varchar2
as
v_ename varchar2(100);
begin
select ename into v_ename
    from emp 
        where empno=pempno;
    return v_ename;
end;
/

declare
v_str varchar2(100);
begin
v_str:=FN_GET_ENAME(7369);
prc_debug(v_str);
end;
/


select  lower(ename) from emp;

select fn_get_ename(empno) from emp;



create or replace function fn_get_ename (pempno number)
return varchar2
as
v_ename varchar2(100);
begin
select ename into v_ename
    from emp 
        where empno=pempno;
    prc_debug(v_ename);
    return v_ename;
end;
/


select fn_get_ename(empno) from emp;



create or replace function fn_get_ename (pempno number)
return varchar2
as
v_ename varchar2(100);
begin
select ename into v_ename
    from emp 
        where empno=pempno;
    dbms_output.put_line(v_ename);
    return v_ename;
end;
/


select fn_get_ename(empno) from emp;

--update
-- comm comm+sal
-- comm not there sal
--return new sal

-- 100 10 ==> 110 
-- 100   ==100

create or replace function fn_update_sal(PEMPNO number)
return number
as
v_result number;
begin
update emp set sal= case when comm is not null then sal+comm
                    else sal end 
                where empno=pempno;
select sal  into v_result
        from emp 
        where empno=pempno;
    commit;
    return v_result;
end;
/

select * from emp;

declare
v_result number;
begin
v_result:=fn_update_sal(7499);
prc_debug(v_result);
end;

-- dml operation inside function (update sal with comm)
    -- return upted sal
    -- comm should  become null
    
    -- 100 10 --> 110 null
    --100 null --> 100 100
    

select fn_update_sal(empno) from emp;



create or replace function fn_test
return number
as
begin
prc_debug('Hello');
end;
/   

DECLARE
  v_Return NUMBER;
BEGIN
  v_Return := FN_TEST();
END;

----------------------------------------------





































