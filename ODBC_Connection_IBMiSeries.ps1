$system = 'XXXXX'
$driver = 'iSeries Access ODBC Driver'
$select = 'XXXX'
$from = 'XXXX'
$where = "XXXX like 'XXXX%' and XXXX like 'XXXX%'"
$database = 'XXX'
$query = "SELECT $select FROM $from WHERE $where"

$conn = New-Object System.Data.Odbc.OdbcConnection
$conn.ConnectionString = "Driver={$driver};System=$system;Port=XXX;Integrated Security=SSPI;"

$conn.Open()
$cmd = New-Object System.Data.Odbc.OdbcCommand($query, $conn)

$cmd.CommandTimeout = 30
$ds = New-Object system.Data.DataSet

$da = New-Object system.Data.odbc.odbcDataAdapter($cmd)
[void]$da.fill($ds)
$conn.close()
$result = $ds.Tables[0]