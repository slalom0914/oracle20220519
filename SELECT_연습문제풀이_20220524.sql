1.1.�� �޿��� ������ 18�� ������ Ȧ�� �޿��� ������ 1/18�� ���޵ǰ�, 
¦���޿��� ������ 2/18�� ���޵ȴٰ� �������� �� Ȧ�� �ް� ¦�� �޿� ���� �ݾ��� ��Ÿ���ÿ�.

SELECT * FROM temp

SELECT emp_name, salary FROM temp


SELECT emp_name, salary, salary/18 "Ȧ���޿� �޿�"
  FROM temp

SELECT emp_name, salary
     , salary/18 "Ȧ���޿� �޿�" , salary/9 "¦���޿� �޿�"
  FROM temp
  
SELECT emp_name, salary
     , salary/18 "Ȧ���޿� �޿�" , salary/9 "¦���޿� �޿�"
  FROM temp
  
SELECT round(1234567.456, 1) -- �Ҽ� 2��° �ڸ����� �ݿø��ϱ�
      ,round(1234567.456, -1) -- �Ҽ��� �������� ���� �ö󰡸� ������ ������
      ,round(1234567.456, -2) -- �Ҽ��� �������� ���� �ö󰡸� ������ ������
      ,round(1234567.456, 2)
  FROM dual  
  
SELECT emp_name, salary
     , round(salary/18,-1) "Ȧ���޿� �޿�" 
     , round(salary/9,-1) "¦���޿� �޿�"
  FROM temp  
  
SELECT emp_name, salary
     , round(salary/18,-1)||'��' "Ȧ���޿� �޿�" 
     , round(salary/9,-1)||'��' "¦���޿� �޿�"
  FROM temp  
  
SELECT emp_name, salary
     , TO_CHAR(round(salary/18,-1),'999,999,999')||'��' "Ȧ���޿� �޿�" 
     , TO_CHAR(round(salary/9,-1),'999,999,999')||'��' "¦���޿� �޿�"
  FROM temp
    
SELECT 
       550000, TO_CHAR(sysdate, 'YYYYMMDD')
       ,TO_CHAR(sysdate, 'MMDD')
       ,sysdate, sysdate-1, sysdate+1
  FROM dual  
  
�������� ���������� ��ȯ�� �ִ� �Լ��� �ִ�. 
to_char(��¥,'YYYYMMDD')
to_char(500000,'999,999,999')  
  
SELECT 
       550000, TO_CHAR(550000,'999,999')
      ,TO_CHAR(5500000,'999,999,999')
       ,TO_CHAR(550000.123,'999,999,999.999')
  FROM dual  
  
  
2.������ ���� �� �޿��� ����� 10������ ���޵ȴٸ�(¦������ 20����)���� ������ 
��� �ٲ��� �ۼ��� ���ÿ�.

SELECT emp_name, salary
     , TO_CHAR((round(salary/18,-1)+100000),'999,999,999')||'��' "Ȧ���޿� �޿�" 
     , TO_CHAR((round(salary/9,-1)+200000),'999,999,999')||'��' "¦���޿� �޿�"
  FROM temp


null�� �𸥴� , �������� �ʾҴ�., �׷��� �������� �ƴϴ�.

SELECT 
       count(empno), count(comm)
  FROM emp

-- emp�̿��� ��

SELECT ename, sal FROM emp


���������̴�. - range scan�� �ϴ� ����� �̴�.
�����˻�

�������̴�.

SELECT empno FROM emp 
WHERE ename='SCOTT'

SELECT empno FROM emp 
WHERE ename='scott'

�츮ȸ�翡 �ٹ��ϴ� ��� �߿��� �μ���ȣ�� 10 �̰ų� 30�� ����� �̸��� �μ� ��ȣ�� ����ϴ�
sql�� �ۼ��Ͻÿ�.

SELECT ename, deptno FROM emp

SELECT ename, deptno FROM emp
WHERE deptno = 10

SELECT ename, deptno FROM emp
WHERE deptno = 30


SELECT ename, deptno FROM emp
WHERE deptno = 10
UNION ALL
SELECT ename, deptno FROM emp
WHERE deptno = 30


SELECT ename, deptno FROM emp
WHERE deptno = 10
   OR deptno = 30
   
SELECT ename, deptno FROM emp
WHERE deptno IN (10,30)
   


�츮ȸ�翡 �ٹ��ϴ� ��� �߿��� �μ�Ƽ�긦 �޴� ����� �̸�, �μ�Ƽ����� ����ϴ� 
sql���� �ۼ��Ͻÿ�.

SELECT
       ename, comm
  FROM emp



3.TEMP ���̺��� ��̰� NULL �� �ƴ� ����� ������ �о���ÿ�.

IS NULL

IS NOT NULL

SELECT ename, comm
  FROM emp
 WHERE comm is not null

������ ���

SELECT ename, comm
  FROM emp
MINUS
SELECT ename, comm
  FROM emp
 WHERE comm is null  

SELECT ename, comm
  FROM emp
INTERSECT
SELECT ename, comm
  FROM emp
 WHERE comm !=0 
 

SELECT emp_name FROM temp


SELECT emp_name FROM temp
WHERE hobby !=null

SELECT emp_name FROM temp
WHERE hobby <> null

SELECT emp_name FROM temp WHERE hobby is not null

SELECT ename , comm
  FROM emp
 WHERE comm = null

�� �̱������̼��� ���̸� ���ڿ� - varchar2

SELECT ename , comm
  FROM emp
 WHERE comm = 'null'
 
�츮ȸ�翡 �ٹ��ϴ� ������� �޿� �Ѿ��� ���Դϱ�?

SELECT sum(sal) FROM emp

SELECT
       DECODE(job,'CLERK', sal)
      ,DECODE(job,'SALESMAN', sal)
      ,DECODE(job,'CLERK',null,'SALESMAN',null, sal)
  FROM emp 

SELECT
       SUM(DECODE(job,'CLERK', sal, null)) as "clerk_sum"
      ,SUM(DECODE(job,'SALESMAN', sal, null)) as "salesman_sum"
      ,SUM(DECODE(job,'CLERK',null,'SALESMAN',null, sal)) as "etc_sum"
  FROM emp 


4.TEMP ���̺��� ��̰� NULL�� ����� ��� HOBBY�� ���������̶�� ���� ġȯ�Ͽ� �������� �������� �״�� ���� �о���ÿ�.

SELECT 
       emp_name, NVL(hobby,'����') as "hobby"
  FROM temp
  
����

SELECT
  FROM
 WHERE
ORDER BY

SELECT empno FROM emp  

order by�� �ϸ� ��ĵ�� ��� ������� ���ϰ� 
2�� ������ �ؾ߸� �Ѵ�. - ������

order by�� ���� �ʰ� ������ �� �� �ִٸ� nice

hint���� ����Ͽ� ��Ƽ���������� ������ ������ ������ �� �ִ�.
���� ��Ÿ�� ������ ���õȴ�.

index�� �����ϴ� �÷��� ���̺� �＼�� ���� ����� ������
order by ���� ������ �� �ִٸ� �˻� �ӵ��� ���� �� �ִ�.

SELECT
       /*+ index_desc(emp pk_emp) */ empno
  FROM emp
  
-- ���̺��� pk�� �ε����� ������
-- �ε����� �ִ� �÷��� ���̺� access ���� ��°�����  

SELECT rowid rid FROM emp

SELECT ename, deptno, job FROM emp
WHERE rowid = 'AAARE8AAEAAAACTAAC'

DBMS�� ������ �ִ� ��� �������� ������ ������ �ĺ���
index���̺��� index key �� rowid�� ������
������ �������� ������ index ���̺� ���� �ִ� rowid�� 
�ش� �����͸� ã�� ���� �ϳ��� ������ �����̴�.
1) 6�ڸ� : ������ ������Ʈ ��ȣ
2) 3�ڸ� : ������� ���� ��ȣ
3) 6�ڸ� : ��Ϲ�ȣ
4) 3�ڸ� : ��� ���� �� ��ȣ

rownum

SELECT rownum, empno FROM emp

SELECT rownum, empno FROM emp
WHERE deptno = 30
  
SELECT empno FROM emp

SELECT ename FROM emp  
  
SELECT empno, ename FROM emp  

SELECT empno FROM emp  
ORDER BY empno desc
  
SELECT ename FROM emp  

SELECT ename FROM emp
ORDER BY ename desc

SELECT ename FROM emp
ORDER BY ename asc

NVL

SELECT comm, NVL(comm, 0) FROM emp

--���� ���̺� ���� ���ϴ� ���� �ƴϴ�.


5.TEMP�� �ڷ� �� HOBBY�� ���� NULL�� ����� ����ꡯ���� ġȯ���� �� HOBBY��
 ������� ����� ������ �������� ������ �ۼ��Ͻÿ�.

SELECT emp_name, NVL(hobby, '����'), NVL(hobby, '���') FROM temp


6.TEMP�� �ڷ� �� EMP_ID�� EMP_NAME�� ���� �������,���������� ǥ�õǾ� DISPLAY�ǵ��� COLUMN ALLIAS�� �ο��Ͽ� SELECT �Ͻÿ�.

SELECT
       emp_id, emp_name
 FROM temp

SELECT
       emp_id as "������̵�", emp_name as "����"
 FROM temp


7.TEMP�� �ڷḦ ���� ��(LEV)�� ASCENDING�ϸ鼭 ��������� �ٽ� ��� ������ 
DESCENDING�ϰ� �ϴ� ORDER BY�ϴ� ������ ����� ���ÿ�.



SELECT 1+5, 6-2, 2*3, 10/2 FROM dual

����

SELECT count(empno) FROM emp

SELECT count(empno) 
  FROM (SELECT empno FROM emp WHERE sal >= 2000)  - �ζ��κ� - ���� -������
  
DBA  
  
SELECT empno FROM emp WHERE sal >= 2000  

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual
UNION ALL
SELECT 3 FROM dual


SELECT deptno FROM emp
MINUS
SELECT deptno FROM dept


SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp


SELECT deptno FROM dept
INTERSECT
SELECT deptno FROM emp


DELETE FROM dept

SELECT
       point_nu
      ,rank() over(order by point_nu desc) rnk
  FROM t_greport
  
  
SELECT * FROM t_worktime  

SELECT workcd_vc, time_nu FROM t_worktime  

SELECT workcd_vc, time_nu FROM t_worktime 
ORDER BY time_nu asc

SELECT rownum rnk, workcd_vc, time_nu FROM t_worktime 
ORDER BY time_nu asc


SELECT rownum rnk, workcd_vc, time_nu FROM t_worktime 

SELECT rownum rnk, time_nu
  FROM (
        SELECT workcd_vc, time_nu FROM t_worktime 
        ORDER BY time_nu asc  
       )
       
SELECT ename, deptno, dname
  FROM emp  

SELECT dname FROM dept

SELECT a.time_nu, b.time_nu FROM t_worktime a, t_worktime b

SELECT rownum rno, ename FROM emp
WHERE rownum < 4
       
SELECT time_nu FROM t_worktime
WHERE rownum < 4

SELECT
       a.time_nu
  FROM (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4  
       )a,
       (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4        
       )b
       
SELECT
       a.time_nu
  FROM (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4  
       )a,
       (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4        
       )b
 WHERE a.time_nu < b.time_nu       
              
 
SELECT
       a.time_nu
  FROM (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4  
       )a,
       (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4        
       )b
 WHERE a.time_nu <= b.time_nu   
 
SELECT
       a.time_nu, b.time_nu
  FROM (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4  
       )a,
       (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4        
       )b
 WHERE a.time_nu <= b.time_nu    
 
������տ��� deptno�� fk�̰� ������տ��� pk�� �����ȣ�� �¾ƿ� 
�μ����տ��� deptno�� pk�̴�
�μ����տ� deptno�� �޾Ƽ� �¾ �ڼ��� ��������̰� 
���� �θ��� deptno�� �ڼ����� ���� �ܷ�Ű�� �Ǿ���.
 
SELECT deptno FROM emp, dept 

SELECT a.deptno FROM emp a , dept b 

SELECT b.deptno FROM emp a , dept b 

SELECT empno FROM emp


SELECT
       a.time_nu, count(b.time_nu)
  FROM (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4  
       )a,
       (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4        
       )b
 WHERE a.time_nu <= b.time_nu   
GROUP BY a.time_nu
ORDER BY count(b.time_nu) asc 


group by��

�츮 ȸ�翡 �ٹ��ϴ� ����鿡 ���ؼ� �μ��� ������� ����ϰ� �ʹ�
�����?

������� - FK - deptno

FK�� �ߺ��� ����ȴ�.
�ε����� �������� �ʴ´�.
FK�� �����̼��̴�.(1:n ��������)

SELECT empno
  FROM emp
GROUP BY dname  

SELECT deptno
  FROM emp
GROUP BY deptno

SELECT empno
  FROM emp
GROUP BY empno

SELECT COUNT(empno)
  FROM emp
GROUP BY deptno 

SELECT deptno, COUNT(empno)
  FROM emp
GROUP BY deptno 

�׷��Լ� - avg, count, max, min, sum

���̺� ��ü �����Ϳ��� ������� ����� ��� ���ؼ� �� ���տ� 
�����Ͽ� �ϳ��� ����� ������

�Ϲ��÷��� �׷��Լ��� ���� �� �� �ֳ�?
����

SELECT sum(sal) FROM emp

SELECT sum(sal), ename FROM emp

�������� ������ �ذ������� �ǹ̰� ����.(�������谡 ����)

SELECT sum(sal), max(ename) FROM emp

SELECT sum(sal) FROM emp
GROUP BY deptno

SELECT sum(sal) FROM emp

group by�� ����� �÷����� select������ 
������� �� �ǹ̰� �ִ�. �������� �ִ�.

SELECT sum(sal),deptno FROM emp
GROUP BY deptno

SELECT max(sal), avg(sal),deptno FROM emp
GROUP BY deptno


�׷��ٸ� �ذ� ����� �ֳ���?
�ϳ�. �Ϲ��÷��� �׷��Լ��� �����
�� . group by���� �߰��ؼ� �Ϲ� �÷����� ���´�.


SELECT * FROM t_letitbe

SELECT MOD(6,2), MOD(6,3) FROM dual

if(6%2==0)


SELECT DECODE(1,1,'����','�ٸ���'), DECODE(1,2,'����','�ٸ���') FROM dual

SELECT
       DECODE(MOD(seq_vc,2),1, words_vc) eng_words
  FROM t_letitbe
  
SELECT MOD(seq_vc,2) no
      ,DECODE(MOD(seq_vc,2),1, words_vc) eng_words
  FROM t_letitbe

SELECT MOD(seq_vc,2) no
      ,DECODE(MOD(seq_vc,2),1, words_vc) eng_words
  FROM t_letitbe
 WHERE MOD(seq_vc,2) = 1   
  
  
SELECT
       DECODE(MOD(seq_vc,2),1, words_vc,null) eng_words
  FROM t_letitbe  
  
SELECT
       DECODE(MOD(seq_vc,2),0, words_vc,null) kor_words
  FROM t_letitbe    
  
  
SELECT
       DECODE(MOD(seq_vc,2),1, words_vc,null) eng_words
  FROM t_letitbe  
UNION ALL  
SELECT
       DECODE(MOD(seq_vc,2),0, words_vc,null) kor_words
  FROM t_letitbe   
  
SELECT seq_vc FROM t_letitbe 
ORDER BY seq_vc desc 

SELECT seq_vc FROM t_letitbe 
ORDER BY TO_NUMBER(seq_vc) desc 


SELECT
       seq_vc, decode(mod(seq_vc,2),1, words_vc)
  FROM t_letitbe
  
SELECT
       seq_vc, decode(mod(seq_vc,2),0, words_vc)
  FROM t_letitbe  