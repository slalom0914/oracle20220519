문제
temp에서 사번, 성명, 부서코드를 읽어내는데 부서명칭을 함께 보고 싶은
경우에 어떡하지?

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
 
INNER JOIN 은
JOIN 조건을 만족하는 행만 질의의 결과로 가져옵니다.

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
 
연습문제
tcom의 work_year가 2001인 자료와 temp를 사번으로 연결해서 조인한 후
comm을 받는 직원의 성명, salary+comm 을 조회하는 sql문을 작성하시오.

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
   
   
non-equal 조인
: 조인 조건이 =이 아닌 다른 연산기호로 주어지는 경우

temp와 emp_level을 이용해 emp_level의 과장 직급의
연봉 상한/하한 범위 내에 드는 직원의 사번과 성명, 직급, salary를
읽어오는 sql문을 작성하시오.

SELECT
      a.emp_id, a.emp_name
     ,a.lev, a.salary
  FROM temp a, emp_level b
WHERE a.salary BETWEEN b.from_sal AND b.to_sal
  AND b.lev = '과장'
   
  
outer join
두 개 이상의 테이블 조인시 한쪽 테이블의 행에 대해 다른쪽 테이블에 일치하는
행이 없더라도 다른쪽 테이블의 행을 null로 하여 행을 return 하는 것이
outer join이다

SELECT
       컬럼1, 컬럼2,...
  FROM 테이블1, 테이블2
 WHERE 테이블1.컬럼 = 테이블2.컬럼(+)
 
이 경우 기준이 되는 테이블은 테이블1 이다
결합된 컬럼 값이 테이블2에 없더라도 테이블1에 있으면
테이블2의 값들 중 테이블1과 일치되는 값이 없는 행은 모두 NULL로
리턴 된다. 


각 사번의 성명, salary, 연봉하한금액, 연봉상한금액을 보고자 한다.
 temp와 emp_level을 조인하여 결과를 보여주되
 연봉의 상하한이 등록되어 있지 않은 수습 사원은 성명, salary까지만
 이라도 나올 수 있도록 쿼리문을 작성하시오.
 
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
    
tdept 테이블에 자신의 상위 부서정보를 관리하고 있다
이 테이블을 이용하여 부서코드, 부서명, 상위부서코드, 상위부서명을 
읽어오는 쿼리를 작성하시오.


SELECT * FROM tdept    

SELECT
       '부서코드' as "부서코드"
      ,'부서명' as "부서명"
      ,'상위부서코드' as "상위부서코드"
      ,'상위부서명' as "상위부서명"
  FROM tdept a, tdept b

SELECT
       '부서코드' as "부서코드"
      ,'부서명' as "부서명"
      ,'상위부서코드' as "상위부서코드"
      ,'상위부서명' as "상위부서명"
  FROM tdept a, tdept b
 WHERE b.dept_code = a.parent_dept  

SELECT
       a.dept_code as "부서코드"
      ,a.dept_name as "부서명"
      ,'상위부서코드' as "상위부서코드"
      ,'상위부서명' as "상위부서명"
  FROM tdept a, tdept b
 WHERE b.dept_code = a.parent_dept  

SELECT
       a.dept_code as "부서코드"
      ,a.dept_name as "부서명"
      ,b.dept_code as "상위부서코드"
      ,b.dept_name as "상위부서명"
  FROM tdept a, tdept b
 WHERE b.dept_code = a.parent_dept  