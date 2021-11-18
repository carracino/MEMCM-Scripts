    #Machine Policy registry file
    $MachineRegistryFile = "$env:Windir\System32\GroupPolicy\Machine\Registry.pol"

    #Get Machine Policy registry file signature. A good file should only return 80, 82, 101, 103
    $MachineFileContent = ((Get-Content -Encoding Byte -Path $MachineRegistryFile -TotalCount 4 -ErrorAction SilentlyContinue) -join '')

    if(!(Test-Path -Path $MachineRegistryFile -PathType Leaf))
    {
        Write-Host "Machine registry.pol file not found on $ComputerName." 
    }
    else
    {
        if(($MachineFileContent -join '') -eq '8082101103')
        {
            return $true
        }
        else
        {
            return $false
        }
    }
