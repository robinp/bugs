=== pgsql

$ mkdir /tmp/pgbug
$ cd /tmp/pgbug
$ initdb .

Edit postgresql.conf:

Need to start postgres with
  timezone='UTC'
in its config file for example. Or with any timezone different than server
timezone.

$ pg_ctl -D . -l logfile start -o "-c listen_addresses= -c unix_socket_directories=/tmp/pgbug"

$ urweb main -dbms postgres -db "postgresql:///postgres?host=/tmp/pgbug"

Now trigger /Main/main.

postgres=# SELECT * FROM uw_main_tab ;
      uw_timey       |        uw_sqltimey         
---------------------+----------------------------
 2019-01-06 17:37:09 | 2019-01-06 16:37:09.932354
(1 row)

postgres=# SELECT CURRENT_TIMESTAMP;
       current_timestamp
-------------------------------
 2019-01-06 16:44:55.312171+00    <--- mind the TZ, not actual minutes.
(1 row)


(Similar displayed on website).

=== sqlite

sqlite> SELECT * FROM uw_Main_tab ;
2019-01-06 17:43:10|2019-01-06 16:43:10
sqlite> SELECT CURRENT_TIMESTAMP;
2019-01-06 16:43:54

