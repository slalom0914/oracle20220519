
SELECT * FROM t_giftmem

SELECT * FROM t_giftpoint

SELECT *
  FROM t_giftmem, t_giftpoint
  
SELECT t_giftmem.point_nu as "��������Ʈ"
  FROM t_giftmem, t_giftpoint  
  
SELECT t_giftmem.point_nu as "��������Ʈ"
      ,t_giftpoint.point_nu as "��������Ʈ"
  FROM t_giftmem, t_giftpoint    
  
SELECT t_giftmem.point_nu as "��������Ʈ"
      ,t_giftpoint.point_nu as "��������Ʈ"
      ,t_giftmem.point_nu -t_giftpoint.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem, t_giftpoint   
  
�� ���� ���� ������ �ɱ��?
���� �����ϰ� ����Ʈ�� ���� ������ ��ǰ�� �ִ�.

���� ������ ����Ʈ >= ��ǰ�� ����Ʈ

������ ���� ���� �� ���� ��ǰ�̴�. ���ܽ��Ѿ� �Ѵ�. ����� ������ 30����  5*6
������ õõ�� �Ĳ��ϰ� �о �ִ����� ������ ����
  
��ȭƼ���ΰ� �߿��� and
6�� ��ǰ�߿��� �ϳ��� ������.
mem.point_nu >= point.point_nu

�̸�  ��������Ʈ ��������Ʈ ��������Ʈ-��������Ʈ

6���߿��� �ϳ��� ���Ѵ�.

SELECT point_nu
  FROM t_giftpoint
 WHERE name_vc = '��ȭƼ��'
 
 
SELECT mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu -point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem
    , (
        SELECT point_nu
          FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��'    
      )point
 
 
SELECT mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu -point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem
    , (
        SELECT point_nu
          FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��'    
      )point
 WHERE mem.point_nu >= point.point_nu     


SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu -point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem
    , (
        SELECT point_nu
          FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��'    
      )point
 WHERE mem.point_nu >= point.point_nu    


SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu -point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem, t_giftpoint point
 WHERE mem.point_nu >= point.point_nu
   AND point.name_vc = '��ȭƼ��'  


SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu -point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem, t_giftpoint point
 WHERE mem.point_nu >= point.point_nu
   AND point.name_vc =:x 
   
���� x �� UI���� ���� �´�.   


����2

SELECT
       point_nu
  FROM t_giftmem
 WHERE name_vc = '������'
 
SELECT
       point_nu
  FROM t_giftmem
 WHERE name_vc =:name
 
SELECT point_nu
  FROM t_giftpoint
 WHERE point_nu <= 50012 
 
SELECT point_nu
  FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '������' 
                   ) 
                   
SELECT max(point_nu)
  FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '������' 
                   )                    
                   
�׷��Լ��� �Ϲ��÷��� ���� ����� �� ����.                   

SELECT max(point_nu), min(name_vc)
  FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '������' 
                   )  
                   
                   
SELECT name_vc, point_nu
  FROM t_giftpoint
 WHERE point_nu = 50000                   
 
 
SELECT name_vc, point_nu
  FROM t_giftpoint
 WHERE point_nu = (
                    SELECT max(point_nu)
                      FROM t_giftpoint
                     WHERE point_nu <= (
                                        SELECT
                                               point_nu
                                          FROM t_giftmem
                                         WHERE name_vc = '������' 
                                       )   
                  )  
                  
                  
SELECT
       ename
  FROM emp                  
  
  
SELECT
       ename
  FROM emp 
 WHERE ename LIKE 'S%'   
 
SELECT
       ename
  FROM emp 
 WHERE ename LIKE '%S'    
 
SELECT
       ename
  FROM emp 
 WHERE ename LIKE '%S%'   
 
SELECT *
  FROM emp
 WHERE ename LIKE '%M%I%'
 
 
SELECT *
  FROM emp
 WHERE ename LIKE '____'
 
SELECT *
  FROM emp
 WHERE ename LIKE '____S'   
 
��������
������

SELECT ename, sal
  FROM emp
 WHERE sal > 1000
   AND sal < 3000
   
SELECT ename, sal
  FROM emp
 WHERE sal BETWEEN 1000 AND 3000 
 
SELECT ename, sal
  FROM emp
 WHERE sal >= 1000
   AND sal <= 3000 
   
SELECT
*
  FROM temp   