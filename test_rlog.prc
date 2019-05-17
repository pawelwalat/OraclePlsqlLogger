CREATE OR REPLACE PROCEDURE TEST_RLOG (pv_v1    varchar2,
                                      pv_v2    varchar2 DEFAULT NULL ,
                                      pv_v3    varchar2 DEFAULT NULL ,
                                      pv_v4    varchar2 DEFAULT NULL ,
                                      pv_v5    varchar2 DEFAULT NULL )
IS
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   INSERT INTO TEST_LOGS
     VALUES   (SYSTIMESTAMP,
               pv_v1,
               pv_v2,
               pv_v3,
               pv_v4,
               pv_v5);

   COMMIT;
END;
/