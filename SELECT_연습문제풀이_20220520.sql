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

SELECT emp_name FROM temp


SELECT emp_name FROM temp
WHERE hobby !=null

SELECT emp_name FROM temp
WHERE hobby <> null

SELECT emp_name FROM temp WHERE hobby is not null

4.TEMP ���̺��� ��̰� NULL�� ����� ��� HOBBY�� ���������̶�� ���� ġȯ�Ͽ� �������� �������� �״�� ���� �о���ÿ�.

SELECT 
       emp_name, NVL(hobby,'����') as "hobby"
  FROM temp

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