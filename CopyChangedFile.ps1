Write-Host "Running change file PS script"
$Home_dir = pwd | Select -exp Path
Write-Host $Home_dir

$changedFiles = Get-Content -Path ${Home_dir}"/changedFiles.txt" | Where-Object { $_ -like "*MAPD*.tra:CHANGED*" }
Write-Host $changedFiles
$startString = $changedFiles.IndexOf("MAPD/")
$startString = $startString + 5
$endString = $changedFiles.IndexOf(".tra")
$endStringlen = $endString - $startString
$filename = $changedFiles.Substring($startString,$endStringlen)
Write-Host $filename
##[System.Environment]::Exit(1)
