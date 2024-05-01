--plsql
--anonymous blocks

declare
begin
exception
end;
/

begin
end;
/

number
varchar
varchar2,
char
clob
raw,
long raw
date
timestamp

pls_Integer
type
rowtype


begin
select ename into v_ename
        from emp where deptno=60;
end;
/

declare
v_ename varchar2(100);
begin
select ename into v_ename
        from emp where deptno=60;
end;
/


declare
v_ename varchar2(100);
begin
select ename into v_ename
        from emp where deptno=60;

dbms_output.put_line(v_ename);
end;
/


select ename 
        from emp where deptno=60;




declare
v_deptno number;
v_ename varchar2(100);
begin
v_deptno :=60;

select ename into v_ename
        from emp where deptno=v_deptno;

dbms_output.put_line(v_ename);

end;
/




declare
v_deptno number :=60;
v_ename varchar2(100);
begin
select ename into v_ename from emp where deptno=v_deptno;
dbms_output.put_line(v_ename);
end;
/




declare
v_deptno number :=60;
v_ename varchar2(100);
begin
select ename into v_ename from emp where deptno=v_deptno;
dbms_output.put_line(v_ename);
end;
/



declare
--v_deptno number :=60;
v_empno number :=7934;
v_ename varchar2(100);
begin
select ename into v_ename from emp where empno=v_empno;
dbms_output.put_line(v_ename);
end;
/




declare
v_empno number :=7934;
v_ename varchar2(100);
begin
select ename, job 
        into v_ename from emp where empno=v_empno;
dbms_output.put_line(v_ename);
end;
/



declare
v_empno number :=7934;
v_ename varchar2(100);
begin
select ename, job 
        into v_ename, v_job from emp where empno=v_empno;
dbms_output.put_line(v_ename);
end;
/


declare
v_empno number :=7934;

v_ename varchar2(100);
v_job varchar2(10);
begin
select ename, job 
        into v_ename, v_job from emp where empno=v_empno;
dbms_output.put_line(v_ename);
end;
/


select * from emp;
declare
v_empno number :=7934;

v_ename varchar2(100);
v_job varchar2(10);
begin
select ename, job 
        into v_ename, v_job from emp where empno=v_empno;
dbms_output.put_line(v_ename || ',' ||v_job);
end;
/



select * from emp;

declare
v_empno number :=7934;

v_sal number;
v_ename varchar2(100);
v_job varchar2(10);
begin
select ename, job , sal
        into v_ename, v_job, v_sal from emp where empno=v_empno;
dbms_output.put_line(v_ename || ',' ||v_job|| ',' || v_sal);
end;
/





create table student_1 (sid number , sname varchar2(10));


insert into student_1 values(1,'AAAAAA');

insert into student_1 values(2,'BBBBBBBBB');


DECLARE
V_SID NUMBER;
V_SNAME VARCHAR2(10);
BEGIN
    SELECT SID, SNAME
            INTO V_SID, V_SNAME
        FROM STUDENT_1  WHERE SID=1;
END;
/

INSERT INTO student_1 VALUES (3,'AAAAA AAAA AAAA');

ALTER TABLE STUDENT_1 MODIFY SNAME VARCHAR2(20);


INSERT INTO student_1 VALUES (3,'AAAAA AAAA AAAA');




DECLARE
V_SID NUMBER;
V_SNAME VARCHAR2(10);
BEGIN
    SELECT SID, SNAME
            INTO V_SID, V_SNAME
        FROM STUDENT_1  WHERE SID=1;
    DBMS_OUTPUT.PUT_LINE(V_SID ||','|| V_SNAME );
END;
/



DECLARE
V_SID NUMBER;
V_SNAME STUDENT_1.SNAME%TYPE;
BEGIN
    SELECT SID, SNAME
            INTO V_SID, V_SNAME
        FROM STUDENT_1  WHERE SID=3;
    DBMS_OUTPUT.PUT_LINE(V_SID ||','|| V_SNAME );
END;
/


select * from student_1;









DECLARE
V_SID NUMBER;
V_SNAME VARCHAR2(20);
BEGIN

    SELECT SID, SNAME
            INTO V_SID, V_SNAME
        FROM STUDENT_1  WHERE SID=3;
    DBMS_OUTPUT.PUT_LINE(V_SID ||','|| V_SNAME );
END;
/



INSERT INTO student_1 VALUES (4,'AAAAA AAAA AAAA AAAA AAAA AAAAA');


ALTER TABLE STUDENT_1 MODIFY SNAME VARCHAR2(32);

INSERT INTO student_1 VALUES (4,'AAAAA AAAA AAAA AAAA AAAA AAAAA');



DECLARE
V_SID NUMBER;
V_SNAME STUDENT_1.SNAME%TYPE;
BEGIN
    SELECT SID, SNAME
            INTO V_SID, V_SNAME
        FROM STUDENT_1  WHERE SID=4;
    DBMS_OUTPUT.PUT_LINE(V_SID ||','|| V_SNAME );
END;
/


SELECT * FROM STUDENT_1;



ALTER TABLE STUDENT_1 MODIFY SID VARCHAR2(10);

UPDATE STUDENT_1 SET SID=NULL;

SELECT * FROM STUDENT_1;

ALTER TABLE STUDENT_1 MODIFY SID VARCHAR2(10);

SELECT * FROM STUDENT_1;





DECLARE
V_SID STUDENT_1.SID%TYPE;
V_SNAME STUDENT_1.SNAME%TYPE;
BEGIN
    SELECT SID, SNAME
            INTO V_SID, V_SNAME
        FROM STUDENT_1  WHERE SID='S4';
    DBMS_OUTPUT.PUT_LINE(V_SID ||','|| V_SNAME );
END;
/




DECLARE
V_STUDENT STUDENT_1%ROWTYPE;
BEGIN
    SELECT SID, SNAME
            INTO V_STUDENT.SID, V_STUDENT.SNAME
        FROM STUDENT_1  WHERE SID='S4';
    
    DBMS_OUTPUT.PUT_LINE(V_STUDENT.SID ||','|| V_STUDENT.SNAME );
END;
/



ALTER TABLE STUDENT_1 ADD BRANCH VARCHAR2(10);


SELECT * FROM STUDENT_1;


UPDATE STUDENT_1 SET BRANCH='ECE';


SELECT * FROM STUDENT_1;




DECLARE
V_STUDENT STUDENT_1%ROWTYPE;
BEGIN
    SELECT SID, SNAME
            INTO V_STUDENT.SID, V_STUDENT.SNAME
        FROM STUDENT_1  WHERE SID='S4';
    
    DBMS_OUTPUT.PUT_LINE(V_STUDENT.SID ||','|| V_STUDENT.SNAME );
END;
/




DECLARE
V_STUDENT STUDENT_1%ROWTYPE;
BEGIN
    SELECT SID, SNAME, branch
            INTO V_STUDENT.SID, V_STUDENT.SNAME, V_STUDENT.branch
        FROM STUDENT_1  WHERE SID='S4';
    
    DBMS_OUTPUT.PUT_LINE(V_STUDENT.SID ||','|| V_STUDENT.SNAME ||','|| V_STUDENT.branch);
END;
/
