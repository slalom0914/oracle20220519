create or replace procedure sp_salary_ename2(v_name in varchar2, v_salary out number)
is
begin
    select sal into v_salary
    from emp
    where ename=v_name;
end;

CREATE OR REPLACE PROCEDURE proc_emp_list(p_emp OUT SYS_REFCURSOR)
IS
BEGIN
  -- 실행문
  OPEN p_emp
   FOR SELECT a.empno, b.dname, a.ename 
         FROM emp a, dept b
        WHERE a.deptno = b.deptno;
  INSERT INTO dept(deptno, dname, loc) VALUES(81,'유지보수팀','포항');  
  commit;    
END;

variable p_emp refcursor;
exec proc_emp_list(:p_emp);
print p_emp;

사원번호를 입력 받아서 사원이 속한 부서별 평균 급여를 구한 다음
그 사원이 평균보다 많으면 10%인상을 평균보다 적으면 20%급여인상을
emp테이블에 반영하는 프로시저를 작성하시오.

declare
  dan number :=2;
  i number :=1;
begin
  while i<=9 loop
    dbms_output.put_line(dan||'*'||i||'='||(dan*i));
    i:= i+1;
  end loop;
end;

declare
  hap number :=0;
  i number :=1;
begin
  while i<=10 loop
    if MOD(i,2)=0 then
      hap:=hap+i;
    end if;
    i:=i+1;
  end loop;
  dbms_output.put_line('1부터 10까지의 합은 '||hap);
end;

CREATE OR REPLACE PROCEDURE proc_emp_salupdate(p_empno IN number, msg OUT varchar2)
IS
   v_rate number;--할증 1.1 or 1.2
   avg_sal number;--평균급여담기
   my_name varchar2(30);--급여인상 대상 이름 담기
   my_sal number;--내가 받는 급여 담기
   up_sal number;--수정된 급여액 담기
BEGIN
   SELECT ename, sal INTO my_name, my_sal
     FROM emp
    WHERE empno = p_empno;--1건 일때만 into문을 사용가능함.
   SELECT avg(sal) INTO avg_sal
     FROM emp
    WHERE deptno = (SELECT deptno
                      FROM emp
                     WHERE empno = p_empno); 
   IF my_sal > avg_sal THEN
    v_rate:=1.1;
   ELSE
      v_rate:=1.2;
   END IF;
   up_sal:= my_sal*v_rate;
   UPDATE emp SET sal = up_sal
    WHERE empno = p_empno;
   commit;
   msg:= my_name||' 사원의 '||my_sal||' 급여가 '||up_sal||'으로 인상 되었습니다.';                  
END;

SQL> show user;
USER은 "SCOTT"입니다
SQL> SELECT * FROM emp WHERE empno=7499;

     EMPNO ENAME      JOB              MGR HIREDATE        SAL       COMM
---------- ---------- --------- ---------- -------- ---------- ----------
    DEPTNO
----------
      7499 ALLEN      SALESMAN        7698 81/02/20       1600        300
        30


SQL> variable msg varchar2(200);
SQL> exec proc_emp_salupdate(7499,:msg);

PL/SQL 처리가 정상적으로 완료되었습니다.

SQL> print msg;

MSG
--------------------------------------------------------------------------------
ALLEN 사원의 1600 급여가 1760으로 인상 되었습니다.

SQL>