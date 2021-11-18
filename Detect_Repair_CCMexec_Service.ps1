#=============================================================================================================================
# Script Name:     Detect_Repair_CCMexec_Service.ps1 
# Notes:  Detect whether service is running and Exit with value of 0 = compiant Or remeditation will be run. 
#         Error code 1 = could not find ccmrepair file, machine may not be managed correctly. 
#=============================================================================================================================

$ServiceName = 'CcmExec'
$FileName = 'C:\windows\ccm\ccmrepair.exe'

    $service = Get-Service -Name $ServiceName -ErrorAction Stop

If ($service.Status -eq 'Stopped')
{
    write-host "Service Unhealthy"
    #Run remediation step:

    If ($FileName)
    {
    $Process = Start-Process $FileName -Wait -PassThru
    write-host "Calling CCMrepair"
    $ExitCode = $process.ExitCode
    return $ExitCode
    Exit 0
    }
    else
    {
    write-host "CCMrepair not found!"
    Exit 1
    }

    
}
else
{
write-host "Service healthy"
Exit 0
}

# SIG # Begin signature block
# MIIHCwYJKoZIhvcNAQcCoIIG/DCCBvgCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUiu+WlmbCwhp9xhRZH2lEf7z1
# LBWgggSpMIIEpTCCA42gAwIBAgIEXRR3PjANBgkqhkiG9w0BAQsFADAjMQswCQYD
# VQQGEwJVUzEUMBIGA1UEChMLQ2FwaXRhbCBPbmUwHhcNMTkwODI3MjAxMjI2WhcN
# MjIwODI3MjA0MjI2WjBkMQswCQYDVQQGEwJVUzEUMBIGA1UEChMLQ2FwaXRhbCBP
# bmUxFDASBgNVBAsTC1dlYiBTZXJ2ZXJzMSkwJwYDVQQDEyBDQVBJVEFMIE9ORSBB
# UFBMSUNBVElPTiBERUxJVkVSWTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
# ggEBANrqUMNkpGcf0RsLDEzAAGuo5/5EJt6oTYaoU9RyDgEtuRD0Urbgfi72dGd3
# BQmrY9lsKZA2jwvphi+67cGuq/YW7jrLxDL5vpjzdnlO3AeTA7L7MbjuuyNCjXBa
# ReN3fPKudZk4rWL0G8P5tLYe2Hjcc3U5Wr060NqRNlbLRd1L6/a1OroivHzpXLBS
# 9PoBzhCv7HlpEa6l/oXpDwRpm2hCOiz9BnIsomEO3/7whUpRuAmjcpFrGovXXrDq
# VYC6qBKvcLV0+QggbIrCQn275IeHCK3otugwKNkL2YnRH4OlmQNhJdqPjRYPZ9lz
# hA+ozly1VopI4FXf0OI1gibreZcCAwEAAaOCAZ4wggGaMAsGA1UdDwQEAwIHgDAT
# BgNVHSUEDDAKBggrBgEFBQcDAzBOBgNVHREERzBFgiBDQVBJVEFMIE9ORSBBUFBM
# SUNBVElPTiBERUxJVkVSWYEham9uYXRoYW4uY2FycmFjaW5vQGNhcGl0YWxvbmUu
# Y29tMBsGA1UdCQQUMBIwEAYJKoZIhvZ9B0QdMQMCAS8wgZAGA1UdHwSBiDCBhTBF
# oEOgQYY/aHR0cDovL2VudHJ1c3RjcmwuY2xvdWQuY2FwaXRhbG9uZS5jb20vQ1JM
# L0MxRW50cnVzdFJvb3RDQTEuY3JsMDygOqA4pDYwNDELMAkGA1UEBhMCVVMxFDAS
# BgNVBAoTC0NhcGl0YWwgT25lMQ8wDQYDVQQDEwZDUkw5MjkwKwYDVR0QBCQwIoAP
# MjAxOTA4MjcyMDEyMjZagQ8yMDIxMTAwMzAxMzAyNlowHwYDVR0jBBgwFoAU2QZQ
# JCILUfbaoNK+g0fabvYq7QMwHQYDVR0OBBYEFMJw1bs6FxHMYZyHw43PWkxCAqMt
# MAkGA1UdEwQCMAAwDQYJKoZIhvcNAQELBQADggEBAB4sGzgshsd2CADc3vI9u6qI
# 39WHw40QatbJp0i1ggzFAN906LpdFMD2AQiyaGI5KejEFXlFb5+BP8rq9kpbPPP2
# efixUwP39G7uFBiKdoX1lPMikHQNp7QKxvLF33CHP0npKyOKku1Y+Al64yBPPYjv
# aGesIewjxr5lUijYa9mxN/LoFaxxhnltIxFtWHUUx7I1kYpWLXB3ywzN3syK/Xql
# k+ky9ouYS/bUvQx3hthUZ3TjtQXduA5G8zaqfRjwT/mj+0iVPYZo8WwxCnSgNVat
# FfFL+zdS98nqjsSbQOg2f6fCoW/NCrsUW5qchwj/dlM7hU99fgJaDPQD9cZOgUUx
# ggHMMIIByAIBATArMCMxCzAJBgNVBAYTAlVTMRQwEgYDVQQKEwtDYXBpdGFsIE9u
# ZQIEXRR3PjAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZ
# BgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYB
# BAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU8tYrxSTSS1kQ1Kgm5gbaX6413u0wDQYJ
# KoZIhvcNAQEBBQAEggEArfezaxhhJgZBsG/Hg4+NArpHCOt698JJmSIcwOFSnufl
# dr0x1NDXQuEgsdygFYXi3PU4Pv0VtZLvcF2j9Haurlp7QZquYtvM/hji4rkFFnoy
# qmiltbKOcDMC8+jdjvJ8T7ZP12wL/stR6iPwgbpcjV5/nsBzahE1g15pPQVwqLvV
# a+ZCUf1opZEXi8ebp+UlIpV/pLlMvIk3qyLig7uOPzcBQmFVdsEbNiNEy1c4EwMV
# dEZpU04XIVjOVxzJwN57cuEdSD3lfA28mUmA82bbwsGFMvIg5iz2M7WHPm4Yt0nt
# Wsfn7O+q+esbgZBzuRjm84ZT/QeHHRjxOGTPlLRLww==
# SIG # End signature block
