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
  -- ���๮
  OPEN p_emp
   FOR SELECT a.empno, b.dname, a.ename 
         FROM emp a, dept b
        WHERE a.deptno = b.deptno;
  INSERT INTO dept(deptno, dname, loc) VALUES(81,'����������','����');  
  commit;    
END;

variable p_emp refcursor;
exec proc_emp_list(:p_emp);
print p_emp;

�����ȣ�� �Է� �޾Ƽ� ����� ���� �μ��� ��� �޿��� ���� ����
�� ����� ��պ��� ������ 10%�λ��� ��պ��� ������ 20%�޿��λ���
emp���̺� �ݿ��ϴ� ���ν����� �ۼ��Ͻÿ�.

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
  dbms_output.put_line('1���� 10������ ���� '||hap);
end;

CREATE OR REPLACE PROCEDURE proc_emp_salupdate(p_empno IN number, msg OUT varchar2)
IS
   v_rate number;--���� 1.1 or 1.2
   avg_sal number;--��ձ޿����
   my_name varchar2(30);--�޿��λ� ��� �̸� ���
   my_sal number;--���� �޴� �޿� ���
   up_sal number;--������ �޿��� ���
BEGIN
   SELECT ename, sal INTO my_name, my_sal
     FROM emp
    WHERE empno = p_empno;--1�� �϶��� into���� ��밡����.
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
   msg:= my_name||' ����� '||my_sal||' �޿��� '||up_sal||'���� �λ� �Ǿ����ϴ�.';                  
END;

SQL> show user;
USER�� "SCOTT"�Դϴ�
SQL> SELECT * FROM emp WHERE empno=7499;

     EMPNO ENAME      JOB              MGR HIREDATE        SAL       COMM
---------- ---------- --------- ---------- -------- ---------- ----------
    DEPTNO
----------
      7499 ALLEN      SALESMAN        7698 81/02/20       1600        300
        30


SQL> variable msg varchar2(200);
SQL> exec proc_emp_salupdate(7499,:msg);

PL/SQL ó���� ���������� �Ϸ�Ǿ����ϴ�.

SQL> print msg;

MSG
--------------------------------------------------------------------------------
ALLEN ����� 1600 �޿��� 1760���� �λ� �Ǿ����ϴ�.

SQL>