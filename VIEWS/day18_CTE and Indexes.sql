--CTE: common table expresstion

select * from emp;
select * from dept;
select * from salgrade;
select * from bonus;

with temp_job_sal as
            (
                select deptno, job, sum(sal) salary from emp group by job,deptno
            ),
     temp_dept_sal as
            (
                select deptno, sum(sal) salary from emp group by deptno
            )
select t1.deptno,t1.job,t1.salary,t2.salary
                        from temp_job_sal t1,temp_dept_sal  t2
                                where t1.deptno=t2.deptno;
                                
with temp as 
            (select  1 from dual)
select * from temp;


with t1 as 
            (select  1 from dual),
    t2 as 
            (select  2 from dual),
     t3 as 
            (select  2 from dual)
        
select * from t1;




with temp_job_sal as
            (
                select deptno, job, sum(sal) salary from emp group by job,deptno
            ),
     temp_dept_sal as
            (
                select deptno, sum(sal) salary from emp group by deptno
            )
select t1.deptno,t1.job,t1.salary,t2.salary
                        from temp_job_sal t1,temp_dept_sal  t2
                                where t1.deptno=t2.deptno
                                and t1.deptno=20;
                                


select deptno, job, sal  from emp;


select deptno, job, sum(sal)  from emp
group by deptno, job
order by 1;


select deptno, job, sum(sal)  from emp
group by cube(deptno, job)
order by 1;

select deptno, sum(sal)  from emp
group by cube(deptno)
order by 1;


select deptno, sum(sal)  from emp
group by rollup(deptno)
order by 1;


select deptno, job, sum(sal)  from emp
group by rollup(deptno, job)
order by 1;


select deptno, job, sum(sal)  from emp
group by rollup( job, deptno)
order by 1;
-------------------------------------------------

select * from emp;

select * from emp where  rownum <=5;

select 
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, rownum
from emp;

7369 -1
7934 -13


select 
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, rownum
from emp order by  job;


7369 -1
7934 -13

select 
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, rownum
from emp
where deptno =30
order by  job;

7499-1
7900-6


select* from emp where rownum <=10;

select* from emp where rownum =10;

select* from emp where rownum =1; -- true

select* from emp where rownum =2;
select* from emp where rownum =3;

select* from emp where rownum >1;

------------------------------------------

select * from emp;


select  EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, rowid
 from emp;
 
 
 select * from  emp where rowid='AAARbSAAFAAAAdfAAB';
 --------------------------------------------------------
 
 alter table emp add constraint pk_emp primary key (empno);
 
 
 select * from emp  where empno= 7566
 
 select * from user_indexes 
 
 unique
 primary key
 
 -------------------------------------------

 
 
 CREATE <UNIQUE|NON UNIQUE>  INDEX <index_name>
		ON <table_name> (<column_name>,<column_name>…);
		

create index idx_emp_job on emp (job);

select  * from emp where job='CLERK'

select  * from emp where deptno =10;


select  * from emp where empno =7876 and job='CLERK';


create index idx_emp_empno on emp (empno);



create index idx_comp_emp  on emp (deptno, job);


person - gender - m or f

CREATE BITMAP INDEX ON emp_data(gender);




select * from emp where job='clerk';

drop index IDX_EMP_JOB;
drop index IDX_COMP_EMP;


select * from emp where job='clerk';


CREATE INDEX <index_name>
		ON <table_name> [ Function(<column_name>,<column_name.)];
		

drop index idx_fun_lower_job;
create index idx_fun_lower_job  on emp lower(job);


create index idx_emp_job on emp (job);


select * from emp where job='CLERK';

select * from emp where LOWER(job)='clerk';

drop index EMP_IDX;

CREATE INDEX EMP_IDX on EMP(LOWER(job));

		SELECT *
		FROM Emp
		WHERE lower(job) like 'clerk';
        

