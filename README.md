# OraclePlsqlLogger
This is very simple example of logging in Oracle and PL/SQL.

In some cases you might want to see what is happening inside long running transaction before it is commited.
You can use AUTONOMOUS_TRANSACTION then as I used in TEST_RLOG procedure.

How to use:
First create table TEST_LOGS, then create procedure TEST_RLOG.

Inside your code put:

TEST_RLOG('some text');
you can pu up to 5 parameters:
TEST_RLOG('some text1', ... , 'some text5');

Logs will appear in:
SELECT * from TEST_LOGS while you procedure is running.


TIP:
If you run any loop you can put log every N iterations. 

Example:

Your code:

BEGIN
FOR v in (SELECT * FROM table) LOOP
  UPDATE TABLE HUGE_TABLE_WITHOUT_INDEX set column=v.column;
END LOOP;
END;

Code with logging every 25 records get updated:

DECLARE
        vi_i number :=0;
BEGIN
FOR v in (SELECT * FROM table) LOOP
  UPDATE TABLE HUGE_TABLE_WITHOUT_INDEX set column=v.column;
  vi:=vi+1;
  IF MOD(vi,25)=0 THEN
        TEST_RLOG('HUGE_UPDATE', 'Next 25 records got updated.','Total updated records till now: '||vi_i);
  END IF;
END LOOP;
END;

