--exception handling
--system defined exceptions
--user defind exception

declare
v_app_id VARCHAR2(100);
begin
    select app_id into v_app_id
        from new_cust_appl where APP_ID =1 ;
    dbms_output.put_line('Transaction successfully complted');
exception
when no_data_found then
dbms_output.put_line('Exception occured..');
end;
/


select * from new_cust_appl;

select * from new_cust_appl where APP_ID =1;


declare
v_app_id VARCHAR2(100);
begin
    begin
    select app_id into v_app_id
        from new_cust_appl where APP_ID =1 ;
    exception
        when no_data_found then
    dbms_output.put_line('Exception occured..');
    end;
    dbms_output.put_line('Transaction successfully completed..');
end;
/



declare
v_mobil_no number;
begin
    select  MOBILE_NUM into v_mobil_no 
    from new_cust_appl where MOBILE_NUM= 99999;
exception
 when too_many_rows then
 dbms_output.put_line('Exception occured ' || sqlcode || ' '|| sqlerrm);
end;
/

--select * from new_cust_appl where MOBILE_NUM= 99999;


declare
v_mobil_no number(2);
begin
    select  MOBILE_NUM into v_mobil_no 
    from new_cust_appl where MOBILE_NUM= 12345;
exception
 when too_many_rows then
 dbms_output.put_line('Exception occured ' || sqlcode || ' '|| sqlerrm);
end;
/



declare
v_mobil_no number(2);
begin
    select  MOBILE_NUM into v_mobil_no 
    from new_cust_appl where MOBILE_NUM= 12345;
exception
 when too_many_rows then
 dbms_output.put_line('Exception occured ' || sqlcode || ' '|| sqlerrm);
 when others then 
 dbms_output.put_line('Other block excuted');
end;
/



declare
v_mobil_no number(2);
begin
    select  MOBILE_NUM into v_mobil_no 
    from new_cust_appl where MOBILE_NUM= 12345;
exception
 when too_many_rows then
 dbms_output.put_line('Exception occured ' || sqlcode || ' '|| sqlerrm);
 when others then 
 dbms_output.put_line(dbms_utility.format_error_backtrace);
 dbms_output.put_line(dbms_utility.format_call_stack);
end;
/