$Details = (Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\SAAZOD)
$sitename = $Details.sitename
$url = '@url@'
$filename = '@filename@'
$Path = "C:\Windows\Temp\" + [guid]::NewGuid() + $filename

$allKeys = @{
    	'Site1' =  'Key1'
	    'Site2' =  'Key2'
	    'Site3' =  'Key3'
	    'Main Office' =  'Key4'
}

$sitekey = $allkeys["$sitename"]

if (($url -eq "") -or ($null -eq $url)) {
    Write-Host "error no site found" -ForegroundColor Magenta
}
else {
    write-host "The url to use is: $url" -ForegroundColor Green
    write-host "The key to use is:"$sitekey
    write-host This is where you would do your install command using the key.
   
    $wc = New-Object System.Net.WebClient
    $wc.DownloadFile($url, ( New-Item -Path $Path -Force ))
    Start-Process -Filepath $Path #and add your key and args
}
