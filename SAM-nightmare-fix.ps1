#Intune Proactive Remediation to resolve SAM database permission LPE issue

#detection:
$detection = icacls C:\windows\System32\config\SAM

If ($detection -like "*BUILTIN\Users:(I)(RX)*")
{
return $False
}
Else
{
return $True
}

#remediation:

#First check status on restore points: If none found, then wont create new RP.
$restorepoints = Get-ComputerRestorePoint
    If ($restorepoints.count -eq 0)
    {
    $CreateNew = $False
    }

#fix acl on SAM dir:
$SAM = icacls C:\windows\System32\config\*.* /inheritance:e

#remove all shadow copies
$removeShadows = vssadmin delete shadows /for=c: /all /Quiet

#check for any remains of restore points:
$restorepoints = Get-ComputerRestorePoint

#confirm removal:
If ($restorepoints.count -eq 0)
{
#compliant
    #try to create new restore point:
    Try{
        If ($CreateNew -ne $False)
        {
        Checkpoint-Computer -Description "SAM-Fix"
        }
    }
    Catch
    {
    write-host $Error[0]
    }
}