1.1.월 급여는 연봉을 18로 나누어 홀수 달에는 연봉의 1/18이 지급되고, 
짝수달에는 연봉의 2/18가 지급된다고 가정했을 때 홀수 달과 짝수 달에 받을 금액을 나타내시오.

SELECT * FROM temp

SELECT emp_name, salary FROM temp


SELECT emp_name, salary, salary/18 "홀수달에 급여"
  FROM temp

SELECT emp_name, salary
     , salary/18 "홀수달에 급여" , salary/9 "짝수달에 급여"
  FROM temp
  
SELECT emp_name, salary
     , salary/18 "홀수달에 급여" , salary/9 "짝수달에 급여"
  FROM temp
  
SELECT round(1234567.456, 1) -- 소수 2번째 자리에서 반올림하기
      ,round(1234567.456, -1) -- 소수점 기준으로 위로 올라가면 음수로 생각함
      ,round(1234567.456, -2) -- 소수점 기준으로 위로 올라가면 음수로 생각함
      ,round(1234567.456, 2)
  FROM dual  
  
SELECT emp_name, salary
     , round(salary/18,-1) "홀수달에 급여" 
     , round(salary/9,-1) "짝수달에 급여"
  FROM temp  
  
SELECT emp_name, salary
     , round(salary/18,-1)||'원' "홀수달에 급여" 
     , round(salary/9,-1)||'원' "짝수달에 급여"
  FROM temp  
  
SELECT emp_name, salary
     , TO_CHAR(round(salary/18,-1),'999,999,999')||'원' "홀수달에 급여" 
     , TO_CHAR(round(salary/9,-1),'999,999,999')||'원' "짝수달에 급여"
  FROM temp
    
SELECT 
       550000, TO_CHAR(sysdate, 'YYYYMMDD')
       ,TO_CHAR(sysdate, 'MMDD')
       ,sysdate, sysdate-1, sysdate+1
  FROM dual  
  
숫자형을 문자형으로 전환해 주는 함수가 있다. 
to_char(날짜,'YYYYMMDD')
to_char(500000,'999,999,999')  
  
SELECT 
       550000, TO_CHAR(550000,'999,999')
      ,TO_CHAR(5500000,'999,999,999')
       ,TO_CHAR(550000.123,'999,999,999.999')
  FROM dual  
  
  
2.위에서 구한 월 급여에 교통비가 10만원씩 지급된다면(짝수달은 20만원)위의 문장이 
어떻게 바뀔지 작성해 보시오.

SELECT emp_name, salary
     , TO_CHAR((round(salary/18,-1)+100000),'999,999,999')||'원' "홀수달에 급여" 
     , TO_CHAR((round(salary/9,-1)+200000),'999,999,999')||'원' "짝수달에 급여"
  FROM temp


null은 모른다 , 결정되지 않았다., 그래서 연산대상이 아니다.

SELECT 
       count(empno), count(comm)
  FROM emp

-- emp이용할 것

SELECT ename, sal FROM emp


선분조건이다. - range scan을 하는 예약어 이다.
구간검색

점조건이다.

SELECT empno FROM emp 
WHERE ename='SCOTT'

SELECT empno FROM emp 
WHERE ename='scott'

우리회사에 근무하는 사원 중에서 부서번호가 10 이거나 30인 사원의 이름과 부서 번호를 출력하는
sql문 작성하시오.

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
   


우리회사에 근무하는 사원 중에서 인센티브를 받는 사원의 이름, 인센티브액을 출력하는 
sql문을 작성하시오.

SELECT
       ename, comm
  FROM emp



3.TEMP 테이블에서 취미가 NULL 이 아닌 사람의 성명을 읽어오시오.

SELECT emp_name FROM temp


SELECT emp_name FROM temp
WHERE hobby !=null

SELECT emp_name FROM temp
WHERE hobby <> null

SELECT emp_name FROM temp WHERE hobby is not null

4.TEMP 테이블에서 취미가 NULL인 사람은 모두 HOBBY를 “없음”이라고 값을 치환하여 가져오고 나머지는 그대로 값을 읽어오시오.

SELECT 
       emp_name, NVL(hobby,'없음') as "hobby"
  FROM temp

NVL

SELECT comm, NVL(comm, 0) FROM emp

--실제 테이블에 값이 변하는 것은 아니다.


5.TEMP의 자료 중 HOBBY의 값이 NULL인 사원을 ‘등산’으로 치환했을 때 HOBBY가
 ‘등산인 사람의 성명을 가져오는 문장을 작성하시오.

SELECT emp_name, NVL(hobby, '없음'), NVL(hobby, '등산') FROM temp


6.TEMP의 자료 중 EMP_ID와 EMP_NAME을 각각 ‘사번’,’성명’으로 표시되어 DISPLAY되도록 COLUMN ALLIAS를 부여하여 SELECT 하시오.

SELECT
       emp_id, emp_name
 FROM temp

SELECT
       emp_id as "사원아이디", emp_name as "성명"
 FROM temp


7.TEMP의 자료를 직급 명(LEV)에 ASCENDING하면서 결과내에서 다시 사번 순으로 
DESCENDING하게 하는 ORDER BY하는 문장을 만들어 보시오.



SELECT 1+5, 6-2, 2*3, 10/2 FROM dual

패턴

SELECT count(empno) FROM emp

SELECT count(empno) 
  FROM (SELECT empno FROM emp WHERE sal >= 2000)  - 인라인뷰 - 보안 -금융권
  
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