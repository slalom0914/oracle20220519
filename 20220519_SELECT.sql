DDL(��ü����) - DBA

DCL(����) - DB���� ���

DML(SELECT, INSERT, DELETE, UPDATE): ������ ���۾�

��ȸ(�����ȸ, �ֹ���ȸ ��� ...)

�Է�,����,����(�Ƿ����� ���� ����)

SELECT �÷���1, �÷���2, .....
 FROM �����̸�(SELECT��- �ζ��κ�)
 
SELECT ename, job
  FROM emp 
  
SELECT ename, job, hiredate
  FROM emp   
  
SELECT ename as "�̸�", job, hiredate
  FROM emp   

50����
��Ƽ������ - �ϲ� - JVM
  
�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� ALLEN����� �޿��� ���ΰ���?

�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� �޿��� 1000�޷� �̻��� ����� �̸�, �޿��� 
����ϴ� select���� �ۼ��Ͻÿ�.

SELECT
       empno, ename, sal, comm, hiredate, deptno, mgr, job
  FROM emp
  
SELECT
       *
  FROM emp  

SELECT
       empno "��� ��ȣ"
      ,empno as "�����ȣ2" --ǥ��
      ,empno �����ȣ
  FROM emp  
  
SELECT ename, sal
  FROM emp  
  
SELECT ename, sal
  FROM emp  
 WHERE sal >= 1000   
 
���ǰ˻��� where�� ����ϸ� �ȴ�. 
 
SELECT ename, sal
  FROM emp  
 WHERE sal >= 2000   
 
where..and ������ : ��ȸ����� �پ���. 
 
SELECT ename, sal
  FROM emp  
 WHERE sal >= 2000  
   AND deptno = 20 
   
or�� �������̴�. ���߿� �ϳ��� �����ϸ� �ȴ�.   
   
SELECT ename, sal
  FROM emp  
 WHERE sal >= 2000  
    OR deptno = 20    
    

SELECT sal
  FROM emp
 WHERE ename = 'ALLEN'    
 
SELECT sal
  FROM emp
 WHERE ename = 'allen'
    
SELECT sal
  FROM emp
 WHERE ename = 'allEN' 