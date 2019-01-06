table tab : { Timey: time, SqlTimey: time }

fun main () : transaction page =
  t <- now;
  dml (INSERT INTO tab (Timey, SqlTimey) VALUES ({[t]}, CURRENT_TIMESTAMP));
  sqlT <- oneRow (SELECT * FROM tab ORDER BY tab.Timey DESC LIMIT 1);
  return <xml>
    <body>
      Code: {[t]}<br/>
      SQL fromCode: {[sqlT.Tab.Timey]}<br/>
      SQL CURRENT_TIMESTAMP: {[sqlT.Tab.SqlTimey]}
    </body>
    </xml>
