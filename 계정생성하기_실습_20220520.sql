sys�������� ������ ��?
?
�ǽ� �ó�����

����Ŭ ������ tomato������ ����� ����� tiger�� �Ѵ�.
tomato������ ����� �������� ������ ����� �ش�.
ts_tomato��� ���̺� �����̽� �̸����� ����Ŭ�� ��ġ�Ǿ� �ִ� �������� ��ġ�� Ȯ���� ��
�Ʒ� DDL���� sys�������� �����Ѵ�.

create tablespace ts_tomato
datafile 'C:\app\user1\oradata\orcl11\tomato.dbf' size 100M;
?
?
�Ʒ��� ������ ������ ���̺����̽��� ���������� ����� ������ Ȯ���ϴ� DML���̴�.
�̰͵� �ݵ�� sys �������� Ȯ���ؾ� �Ѵ�.
 
select tablespace_name, file_name, autoextensible, increment_by
      ,maxbytes
  from dba_data_files
 where tablespace_name = 'TS_TOMATO'
?
?tomato��� ������ ����� ����� tiger�� �ϸ�
tomato������ �ٶ󺸴� ���̺� �����̽��� ts_tomato�� �Ѵ�.
create user tomato identified by tiger
default tablespace ts_tomato
?
tomato�������� �����̳� ���ÿ��� ���� �����ϵ��� ������ �����Ͽ� ������ �ο��� �ش�.
grant create session to tomato  with admin option;