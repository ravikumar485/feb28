create or replace package pkg_trxn 
as
g_txn_id number;
procedure prc_do_trxn(ps_upi_id varchar2, pr_upi_id varchar2, pamount number);
procedure prc_do_trxn(ps_mobil_no number, pr_mobil_no number, pamount number);

end;
/