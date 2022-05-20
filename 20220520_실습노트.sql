SELECT deptno, dname, loc FROM dept

SELECT empno, ename, job, mgr, hiredate, comm, sal, deptno FROM emp

-- 테이블에 저장된 내용 삭제하기
무결성 제약조건(FK_DEPTNO) 때문에 삭제가 불가하다.
마음대로 삭제가 불가하다.- 데이터를 안전하게 보관할 수 있다.
인덱스가 제공된다.(색인-검색 속도 겁나 빠르다)
가지고 다니지 않으니까 잃어버릴 염려 없다.
비에 노트가 젖는 것도 걱정 없다.

DELETE FROM dept

DELETE FROM emp

rollback

dept deptno pk이고 - 기본키
emp deptno fk이다 - 외래키

SELECT 컬럼명1, 컬럼명2,.......
  FROM 집합이름
 WHERE 컬럼명 = 값
 
우리회사에 근무하는 사원 중에서 이름이 SCOTT인 사원이 있니? 

SELECT empno 
  FROM emp
 WHERE 이름 = 'SCOTT'

SELECT empno 
  FROM emp
 WHERE ename = 'SCOTT'
 
SELECT 1 as "존재하니(1:있다, 0이면 없다)"
  FROM emp
 WHERE ename = 'SCOTT' 


SELECT count(empno) 
  FROM emp
 WHERE ename = 'SCOTT'
 
 SELECT 함수명(컬럼명) 
  FROM emp
 WHERE ename = 'SCOTT'

우리회사에 근무하는 사원 중에서 이름이 SCOTT인 사원이 몇 명이니?

tomato아이디가 존재하니? 

tomato아이디가 몇 개 있니? 