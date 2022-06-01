SELECT
       deptno
  FROM emp
 GROUP BY deptno  
 
SELECT
       deptno, SUM(sal)
  FROM emp
 GROUP BY deptno   
 
�׷��Լ��� GROUP BY�� �Բ� ��� ������
�׷��Լ��� ��ü���� ó���̴�.
 
SELECT
       deptno, SUM(sal), AVG(sal)
  FROM emp
 GROUP BY deptno    
 
SELECT
       deptno, SUM(sal), AVG(sal)
  FROM emp
 GROUP BY deptno    
HAVING AVG(sal)>=2000  

SELECT DECODE(1,2,'��','����')
  FROM dual
  
SELECT DECODE(1,1,'��','����')
  FROM dual  
  
SELECT DECODE(2,5,'A',2,'B',3,'C','D')
  FROM dual    
  
IF 2 = 5 THEN
   return 'A';
ELSIF 2 = 2 THEN
   return 'B';
ELSIF 2 = 3 THEN
   return 'C';
ELSE
   return 'D';
END IF; 

Decode�� �Ϲ����� ���α׷��� ����� IF���� SQL���� �Ǵ� PL/SQL
������ ����鿩 ����ϱ� ���Ͽ� ������� ����Ŭ �Լ��̴�.
���� �Ϲ����� ���α׷��� ����� IF���� ������ �� �ִ� �����
�����ϰ� �ִ�.
SELECT���� DECODE����� FROM ���� ����� ��𼭳� ����� �� �ִ�.
FROM���� ����� �� ���ٴ� ���� SELECT�� ���̺��� DECODE�� �̿��Ͽ�
�������� ������ �� ���ٴ� ���̱⵵ �ϴ�.
IF A = B THEN
    RETURN 'T';
END IF; 
 
A�÷��� B�÷��� ���ٸ� 'T'�� RETURN �ް� �ʹٴ� �����̴�.
DECODE�� �̿��ϸ� ������ ���� �ȴ�.
DECODE(A,B,'T')
SELECT������ �̿�ȴٸ� 
A�÷��� B�÷��� ���� Record�� 'T'���� �����޶�� �ǹ̰� �ȴ�.
SELECT DECODE(A,B,'T') AS col1
  FROM TABLE�̸�
 WHERE ...
 
�� ��� A�÷���  B�÷��� ���� �ٸ��ٸ� � ���� �����ڴ°�?
����� ��(NULL)�� ���´�.
�̿Ͱ��� �ܼ��񱳷� ���Ǵ� DECODE�� ���������� ELSE�� �����
������ ������ ELSE�� �ش�� ��� ��(NULL)�� �����Ѵ�.
�ٽ� ���ؼ� �� ������ ������ ���´� ������ ����.
SELECT DECODE(A,B,'T',NULL) AS col1
  FROM TABLE�̸�
 WHERE .... 
 
SELECT * FROM lecture 
 
����:�ִ� ���� �ð��� ������ ������ '�Ϲ�'�� ���� ������ �Ѵ�
��� �ؾ� �ϴ°�?

���ǽð� - lec_time
���� - lec_point

SELECT lec_time, lec_point
  FROM lecture

SELECT lec_time, lec_point, DECODE(1,1,'�Ϲ�'), DECODE(1,2,'�Ϲ�',null)
  FROM lecture

SELECT lec_time, lec_point, DECODE(lec_time,2,'�Ϲ�'), DECODE(1,2,'�Ϲ�',null)
  FROM lecture
  
SELECT lec_time, lec_point, DECODE(lec_time,3,'�Ϲ�'), DECODE(1,2,'�Ϲ�',null)
  FROM lecture  
  
SELECT lec_time, lec_point, DECODE(lec_time,lec_point,'�Ϲݰ���','��Ÿ����')
  FROM lecture    
  
����:�ִ簭�ǽð��� ������ ���� ������ ���ڸ� �˰� �ʹ�.
��� �ؾ� �ϴ°�?
  
SELECT lec_time, lec_point
  FROM lecture  
  
SELECT lec_id,lec_time, lec_point
  FROM lecture
 WHERE lec_time = lec_point    
 
SELECT 2
  FROM lecture
 WHERE lec_time = lec_point    
 
SELECT count(2)
  FROM lecture
 WHERE lec_time = lec_point   
 
SELECT count('A')
  FROM lecture
 WHERE lec_time = lec_point    


 
SELECT count(lec_id)
  FROM lecture
 WHERE lec_time = lec_point    
 
SELECT DECODE(lec_time, lec_point, 'A'), DECODE(lec_time, lec_point, lec_id)
  FROM lecture
  
SELECT COUNT(DECODE(lec_time, lec_point, 'A')), DECODE(lec_time, lec_point, lec_id)
  FROM lecture  
  
SELECT COUNT(DECODE(lec_time, lec_point, 'A'))
     , COUNT(DECODE(lec_time, lec_point, lec_id))
     , MAX(DECODE(lec_time, lec_point, lec_id))
  FROM lecture    
  
SELECT to_char(sysdate, 'DD')
      ,to_char(sysdate, 'MM')
      ,to_char(sysdate, 'DAY')
  FROM dual  
  
SELECT '31'||'11' FROM dual  
  
  
SELECT DECODE(job,'CLERK',sal)
  FROM emp  
 
SELECT SUM(DECODE(job,'CLERK',sal))
  FROM emp  
 
����: ���� �ð��� ������ ������ '�Ϲ�'�� ���Ϲ��� �� ���ĵ�
�ϰ� ���� ��쿡�� ��� �ؾ� �ϴ°�?

SELECT
       lec_id
  FROM lecture
  
SELECT
       lec_id, DECODE(lec_time, lec_point, '�Ϲ�', null)
  FROM lecture  
  
SELECT
       lec_id, DECODE(lec_time, lec_point, '�Ϲ�', null)
  FROM lecture  
ORDER BY  DECODE(lec_time, lec_point, '�Ϲ�', null) asc   

SELECT
       lec_id, DECODE(lec_time, lec_point, '�Ϲ�', null)
  FROM lecture  
ORDER BY  DECODE(lec_time, lec_point, '�Ϲ�', null) desc 

 
�ִ� ���� �ð��� ������ ������ '�Ϲ�' �� '����'�� ���Ϲ��� �� 
���ĵ� �ϰ� ���� ��쿡�� ��� �ؾ��ϴ°�?

SELECT
       lec_id, DECODE(lec_time, lec_point, '�Ϲ�', '����')
  FROM lecture  
ORDER BY  DECODE(lec_time, lec_point, '�Ϲ�', '����') desc 

����:���� �ð��� ������ �ٸ��� NULL�� ���ϵǴ� ��� 'Ư��'�̶��
���ϵǵ��� �Ϸ��� ��� �ؾ��ϴ°�?

SELECT
       lec_id, DECODE(lec_time, lec_point, '�Ϲݰ���', 'Ư������')
  FROM lecture  
  
�ϳ� �� Ǯ��

lec_time�� ũ�� �������, lec_point�� ũ�� ��Ÿ����, ���� ������ '�Ϲݰ���'���� ���� �ް��� �Ѵ�.
�����?

decode�� ũ�� �۴ٴ� ���� �� ����.
���� ���� �͸� ����

SELECT SIGN(5), SIGN(-600), SIGN(10-50), SIGN(10-10) FROM dual

SELECT SIGN(lec_time-lec_point) FROM lecture

SELECT
       lec_id, lec_time, lec_point
      ,DECODE(SIGN(lec_time-lec_point),1,'�������'
                                      ,0,'�Ϲݰ���'
                                      ,-1,'��Ÿ����') as "��������"
  FROM lecture
  
�� ���� �� ���� ���� �����̸� �տ� ���ڰ� ũ��| �۴�
  
  
  
IF A = B THEN
    RETURN 'T';
ELSIF A = C THEN
    RETURN 'F';
ELSE
    RETURN 'X';
END IF;
DECODE(A, B, 'T', C, 'F', 'X')
A�� B�� ������ 'T'�� �����ް� C�� ������ 'F'�� �����ް�, �̵� 
���� �ƴϸ� 'X'�� ���� �ް��� �Ѵٴ� ���̴�.
�Ʒ��� ���� A=B ���� A=C����, A=D����, A=E ���� �ƴϸ� �� ����
��������� ���� ���� '1', '2', '3', '4', '5'�� RETURN �ϰ� �ϴ�
DECODE �����̴�.
DECODE(A, B, '1', C, '2', D, '3', E, '4', '5')

SELECT
DECODE(to_char(sysdate, 'day'),'������', '01'
                              ,'ȭ����', '11'
                              ,'������', '21'
                              ,'�����', '31'
                              ,'�ݿ���', '41'
                              ,'�����', '51'
                              ,'�Ͽ���', '61')
 FROM dual
 
SELECT '31'||'11' FROM dual
 
SELECT '31'|| 
DECODE(to_char(sysdate, 'day'),'������', '01'
                              ,'ȭ����', '11'
                              ,'������', '21'
                              ,'�����', '31'
                              ,'�ݿ���', '41'
                              ,'�����', '51'
                              ,'�Ͽ���', '61')       
  FROM dual
  
SELECT to_char(sysdate, 'DD')|| 
DECODE(to_char(sysdate, 'day'),'������', '01'
                              ,'ȭ����', '11'
                              ,'������', '21'
                              ,'�����', '31'
                              ,'�ݿ���', '41'
                              ,'�����', '51'
                              ,'�Ͽ���', '61')       
  FROM dual
  
��������
��� ���̺��� job�� 'CLERK'�� ����� �޿� ��, 'SALESMAN'�� �����
�޿��� ���� ���ϰ� ������ job�� ���ؼ��� ��Ÿ�� ������ ���Ͻÿ�.  

SELECT DECODE(job,'CLERK',sal, null) FROM emp
    
SELECT DECODE(job,'CLERK',sal, null) 
      ,DECODE(job,'SALESMAN',sal, null) 
  FROM emp
  
SELECT DECODE(job,'CLERK',sal, null) 
      ,DECODE(job,'SALESMAN',sal, null) 
      ,DECODE(job,'CLERK',null,'SALESMAN', null, sal)
  FROM emp  
  
SELECT SUM(DECODE(job,'CLERK',sal, null)) as "clerk_sum" 
      ,SUM(DECODE(job,'SALESMAN',sal, null)) as "salesman_sum" 
      ,SUM(DECODE(job,'CLERK',null,'SALESMAN', null, sal)) as "etc_sum"
  FROM emp    