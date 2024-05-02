create or replace package  body pkg_trxn 
as
    function fn_validate_upi(pupi_id varchar2) 
    return boolean
    as 
    v_cnt number;
    begin
        select count (1) into v_cnt 
            from account where UPI_ADDRESS=pupi_id and UPI_ACTIVE ='A';
        if v_cnt >0 then 
            return true;
        else
            return false;
        end if;
    end;

    procedure prc_log_transaction (ps_upi_id varchar2,pr_upi_id varchar2, pamount number)
    as 
    pragma autonomous_transaction;
    begin
    g_txn_id:=SEQ_TXN_ID.nextval;
    insert into txn_upi (TXN_ID, SENDER_UPI, TXN_INIT_TIME, RECEIVER_UPI, AMOUNT, TXN_STATUS) values 
    (g_txn_id,ps_upi_id, sysdate,pr_upi_id,pamount,'I' );
    commit ; 
    end;
    
 procedure prc_log_transaction (ps_bal number, pststus varchar2,pcmnts varchar2  )
    as 
    pragma autonomous_transaction;
    begin
        update txn_upi set sender_balance =ps_bal,
         TXN_STATUS=   pststus,
        remarks=pcmnts,
        TXN_CMP_TIME=sysdate
        where txn_id=g_txn_id;
        commit;
    end;
    

   procedure prc_do_trxn(ps_upi_id varchar2, pr_upi_id varchar2, pamount number)
    as 
    sender_upi_not_valid exception;
    pragma exception_init(sender_upi_not_valid,-20001);
    receiver_upi_not_valid exception;
    pragma exception_init(receiver_upi_not_valid,-20002);
    v_bal number(10,2);
    vr_acc_id account.acc_id%type;
    vs_acc_id account.acc_id%type;
    begin
        if not fn_validate_upi(ps_upi_id) then 
            raise sender_upi_not_valid;
        else
            if not fn_validate_upi(pr_upi_id) then 
                raise receiver_upi_not_valid;
            else
                dbms_output.put_line('Both Upi id''s are valid');
                
                    select ab.balance,ab.acc_id into v_bal , vs_acc_id
                    from acc_balance ab, account a where a.acc_id=ab.acc_id
                    and a.upi_address=ps_upi_id;
                    
                    prc_log_transaction (ps_upi_id,pr_upi_id, pamount);
                     --5000<4500
                    if pamount<=v_bal  then 
                        select acc_id into vr_acc_id
                                    from account where upi_address=pr_upi_id;
                    
                        update acc_balance set balance=balance+pamount,updated_date =sysdate
                         where acc_id=vr_acc_id;

                        update acc_balance set balance=balance-pamount,updated_date =sysdate
                        where acc_id=vs_acc_id;
                    else
                    prc_log_transaction(v_bal,'F','Insufficent balance');
                    end if;
            end if;
        end if;
    exception
        when sender_upi_not_valid then
        dbms_output.put_line('Sender upi Id not valid');
        when receiver_upi_not_valid then
        dbms_output.put_line('Receiver upi Id not valid');
    end;

    procedure prc_do_trxn(ps_mobil_no number, pr_mobil_no number,pamount number)
    as 
    begin
        null;
    end;
end;
/