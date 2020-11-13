﻿$fix=Search-Resources -XPath "/Person[isExpired=$true and EmployeeStatusCode='3']" -Unconstrained

$fix.count

$ok=$fix | where {$_.EmployeeEndDate -eq $null -and $_.EmployeeStartDate -ne $null}

$ok.count

$ok2fix = $ok |where {$_.ProvisionO365 -eq $true}

$ok2fix.Count

$ok2fix[0]



$fix | % {$_.isExpired=$false}



$fix | % {

    save-resource $_

    start-sleep -Seconds 15

}
