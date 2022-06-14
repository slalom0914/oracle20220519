����
temp���� ���, ����, �μ��ڵ带 �о�µ� �μ���Ī�� �Բ� ���� ����
��쿡 �����?

SELECT
       *
  FROM temp a, tdept b


SELECT
       *
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code 
 
SELECT
       a.emp_id, a.emp_name
     , b.dept_code, B.DEPT_NAME
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code  
 
 
SELECT
       a.emp_id, a.emp_name
     , b.dept_code, B.DEPT_NAME
  FROM temp a JOIN tdept b
    ON a.dept_code = b.dept_code 
    
SELECT
       emp_id, emp_name
     , dept_code, DEPT_NAME
  FROM temp NATURAL JOIN tdept 
 
INNER JOIN ��
JOIN ������ �����ϴ� �ุ ������ ����� �����ɴϴ�.

SELECT
       a.emp_id, a.emp_name
     , b.dept_code, B.DEPT_NAME
  FROM temp a INNER JOIN tdept b
    ON a.dept_code = b.dept_code 

 
SELECT
       a.dept_code
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code  
 
 
SELECT a.deptno
  FROM emp a, dept b 
  
SELECT NVL(a.deptno,0)
  FROM emp a, dept b   
  
SELECT a.deptno
  FROM emp a, dept b 
 WHERE a.deptno = 10  
 
SELECT a.deptno
  FROM emp a, dept b 
 WHERE NVL(a.deptno,0) = 10   

SELECT a.deptno, a.ename
  FROM emp a, dept b 
 WHERE NVL(a.deptno,0) = 10   
 
SELECT a.ename
  FROM emp a, dept b 
 WHERE NVL(a.deptno,0) = 10    
 
SELECT a.ename
  FROM emp a, dept b 
 WHERE comm is not null 
 
SELECT a.deptno
  FROM emp a, dept b 
 WHERE a.deptno = b.deptno  
 
��������
tcom�� work_year�� 2001�� �ڷ�� temp�� ������� �����ؼ� ������ ��
comm�� �޴� ������ ����, salary+comm �� ��ȸ�ϴ� sql���� �ۼ��Ͻÿ�.

SELECT * FROM tcom

SELECT * FROM temp

SELECT 
       a.emp_id
  FROM temp a, tcom b
 WHERE A.EMP_ID = b.emp_id
   
   
SELECT 
       a.emp_id, a.emp_name
      ,a.salary+b.comm
  FROM temp a, tcom b
 WHERE A.EMP_ID = b.emp_id
   AND B.WORK_YEAR='2001'   
   
   
non-equal ����
: ���� ������ =�� �ƴ� �ٸ� �����ȣ�� �־����� ���

temp�� emp_level�� �̿��� emp_level�� ���� ������
���� ����/���� ���� ���� ��� ������ ����� ����, ����, salary��
�о���� sql���� �ۼ��Ͻÿ�.

SELECT
      a.emp_id, a.emp_name
     ,a.lev, a.salary
  FROM temp a, emp_level b
WHERE a.salary BETWEEN b.from_sal AND b.to_sal
  AND b.lev = '����'
   
  
outer join
�� �� �̻��� ���̺� ���ν� ���� ���̺��� �࿡ ���� �ٸ��� ���̺� ��ġ�ϴ�
���� ������ �ٸ��� ���̺��� ���� null�� �Ͽ� ���� return �ϴ� ����
outer join�̴�

SELECT
       �÷�1, �÷�2,...
  FROM ���̺�1, ���̺�2
 WHERE ���̺�1.�÷� = ���̺�2.�÷�(+)
 
�� ��� ������ �Ǵ� ���̺��� ���̺�1 �̴�
���յ� �÷� ���� ���̺�2�� ������ ���̺�1�� ������
���̺�2�� ���� �� ���̺�1�� ��ġ�Ǵ� ���� ���� ���� ��� NULL��
���� �ȴ�. 


�� ����� ����, salary, �������ѱݾ�, �������ѱݾ��� ������ �Ѵ�.
 temp�� emp_level�� �����Ͽ� ����� �����ֵ�
 ������ �������� ��ϵǾ� ���� ���� ���� ����� ����, salary������
 �̶� ���� �� �ֵ��� �������� �ۼ��Ͻÿ�.
 
SELECT
       a.emp_id, a.emp_name
      ,a.salary, b.from_sal, b.to_sal
  FROM temp a, emp_level b
 WHERE a.lev = b.lev(+)  
 

SELECT
       a.emp_id, a.emp_name
      ,a.salary, b.from_sal, b.to_sal
  FROM temp a LEFT OUTER JOIN emp_level b
    ON a.lev = b.lev  
    
SELECT
       a.emp_id, a.emp_name
      ,a.salary, b.from_sal, b.to_sal
  FROM temp a RIGHT OUTER JOIN emp_level b
    ON a.lev = b.lev      
    
tdept ���̺� �ڽ��� ���� �μ������� �����ϰ� �ִ�
�� ���̺��� �̿��Ͽ� �μ��ڵ�, �μ���, �����μ��ڵ�, �����μ����� 
�о���� ������ �ۼ��Ͻÿ�.


SELECT * FROM tdept    

SELECT
       '�μ��ڵ�' as "�μ��ڵ�"
      ,'�μ���' as "�μ���"
      ,'�����μ��ڵ�' as "�����μ��ڵ�"
      ,'�����μ���' as "�����μ���"
  FROM tdept a, tdept b

SELECT
       '�μ��ڵ�' as "�μ��ڵ�"
      ,'�μ���' as "�μ���"
      ,'�����μ��ڵ�' as "�����μ��ڵ�"
      ,'�����μ���' as "�����μ���"
  FROM tdept a, tdept b
 WHERE b.dept_code = a.parent_dept  

SELECT
       a.dept_code as "�μ��ڵ�"
      ,a.dept_name as "�μ���"
      ,'�����μ��ڵ�' as "�����μ��ڵ�"
      ,'�����μ���' as "�����μ���"
  FROM tdept a, tdept b
 WHERE b.dept_code = a.parent_dept  

SELECT
       a.dept_code as "�μ��ڵ�"
      ,a.dept_name as "�μ���"
      ,b.dept_code as "�����μ��ڵ�"
      ,b.dept_name as "�����μ���"
  FROM tdept a, tdept b
 WHERE b.dept_code = a.parent_dept  