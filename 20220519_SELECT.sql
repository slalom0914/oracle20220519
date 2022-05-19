DDL(객체생성) - DBA

DCL(권한) - DB서버 운영자

DML(SELECT, INSERT, DELETE, UPDATE): 데이터 조작어

조회(배송조회, 주문조회 경우 ...)

입력,수정,삭제(실력차이 거의 없다)

SELECT문은 데이터베이스로부터 저장되어 있는 데이터를 검색하는데 사용 한다.

SELECT 문법
INSERT

- DISTINCT : 중복되는 행을 제거하는 옵션.
- * : 테이블의 모든 column을 출력.
- alias : 해당 column에 대해서 다른 이름을 부여할 때 사용.
- table_name : 질의 대상 테이블 명
- WHERE : 조건을 만족하는 행들 만 검색


SELECT 컬럼명1, 컬럼명2, .....
 FROM 집합이름(SELECT문- 인라인뷰)
 
SELECT ename, job
  FROM emp 
  
SELECT ename, job, hiredate
  FROM emp   
  
SELECT ename as "이름", job, hiredate
  FROM emp   

50만명
옵티마이저 - 일꾼 - JVM
  
우리 회사에 근무하는 사원 중에서 ALLEN사원의 급여는 얼마인가요?

우리 회사에 근무하는 사원 중에서 급여가 1000달러 이상인 사원의 이름, 급여를 
출력하는 select문을 작성하시오.

SELECT
       empno, ename, sal, comm, hiredate, deptno, mgr, job
  FROM emp
  
SELECT
       *
  FROM emp  

SELECT
       empno "사원 번호"
      ,empno as "사원번호2" --표준
      ,empno 사원번호
  FROM emp  
  
SELECT ename, sal
  FROM emp  
  
SELECT ename, sal
  FROM emp  
 WHERE sal >= 1000   
 
조건검색시 where절 사용하면 된다. 
 
SELECT ename, sal
  FROM emp  
 WHERE sal >= 2000   
 
where..and 교집합 : 조회결과가 줄어든다. 
 
SELECT ename, sal
  FROM emp  
 WHERE sal >= 2000  
   AND deptno = 20 
   
or는 합집합이다. 둘중에 하나만 만족하면 된다.   
   
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
