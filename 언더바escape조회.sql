create table emailtb(
mem_email varchar2(50))

select * from emailtb

insert into emailtb values('han_test@hot.com')

insert into emailtb values('nam_test@hot.com')

insert into emailtb values('zang_test@hot.com')

commit

SELECT *
  FROM emailtb
 WHERE mem_email LIKE '___\_%' ESCAPE '\'