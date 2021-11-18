$txt = Get-Content -Path "c:\windows\ccm\logs\PolicyAgent.log" -last 5 | Where-Object {$_ -match "Client is not registered yet. Ignore the policy assignments request." -or $_ -eq "*completed with status 0x8000000A"} 
if($txt ){
    "FOUND ERROR"
}else{
    "NO ERROR FOUND"
}

<#
Fix:
$txt = Get-Content -Path "c:\windows\ccm\logs\PolicyAgent.log" -last 5 | Where-Object {$_ -match "Client is not registered yet. Ignore the policy assignments request." -or $_ -eq "*completed with status 0x8000000A"} 
if($txt ){
	Restart-Service 'ccmexec'; Start-Sleep 20;
#or you can use this--->>> start C:\WINDOWS\ccm\CcmRestart.exe -wait; Sleep 20;
	([wmiclass]'ROOT\ccm:SMS_Client').TriggerSchedule('{00000000-0000-0000-0000-000000000024}');
	([wmiclass]'ROOT\ccm:SMS_Client').TriggerSchedule('{00000000-0000-0000-0000-000000000021}');
	([wmiclass]'ROOT\ccm:SMS_Client').TriggerSchedule('{00000000-0000-0000-0000-000000000022}');
	([wmiclass]'ROOT\ccm:SMS_Client').TriggerSchedule('{00000000-0000-0000-0000-000000000042}');
	([wmiclass]'ROOT\ccm:SMS_Client').TriggerSchedule('{00000000-0000-0000-0000-000000000021}')
    "FIXING ERROR"
}else{
    "NO ERROR FOUND"
}

-or

Invoke-WMIMethod -Namespace root\ccm -Class SMS_Client -Name ResetPolicy -ArgumentList "1"
#>