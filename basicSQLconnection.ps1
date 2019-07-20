function Invoke-SQL {
    param(
        [string] $dataSource = "XXX.XXX.XXX.com",
        [string] $database = "XXXX",
        [string] $sqlCommand = "select * from IPAddresses where ipaddress='XXX.XXX.XXX.XXX'"
      )

    $connectionString = "Data Source=$dataSource; " +
            "Integrated Security=SSPI; " +
            "Initial Catalog=$database"

    $connection = new-object system.data.SqlClient.SQLConnection($connectionString)
    $command = new-object system.data.sqlclient.sqlcommand($sqlCommand,$connection)
    $connection.Open()

    $adapter = New-Object System.Data.sqlclient.sqlDataAdapter $command
    $dataset = New-Object System.Data.DataSet
    $adapter.Fill($dataSet) | Out-Null

    $connection.Close()
    $dataSet.Tables

}