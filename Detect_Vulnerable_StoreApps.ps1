#Detection
$IsWebExtensionVulnerable = Get-AppxPackage -allusers -name "Microsoft.WebpImageExtension" | where-object {($_.version -lt "1.0.32")}
$otherExtensionsVulnerable = Get-AppxPackage -allusers -name "*extension*" | where-object {($_.version -lt "1.0.4" -and $_.Name -ne "Microsoft.WebpImageExtension")}

#remediation:
#  $IsWebExtensionVulnerable = Get-AppxPackage -allusers -name "Microsoft.WebpImageExtension" | where-object {($_.version -lt "1.0.32")} | Remove-AppxPackage -AllUsers
# $otherExtensionsVulnerable = Get-AppxPackage -allusers -name "*extension*" | where-object {($_.version -lt "1.0.4" -and $_.Name -ne "Microsoft.WebpImageExtension")} | Remove-AppxPackage -AllUsers