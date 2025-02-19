# SamEnum - Stealthy Active Directory Enumeration Script
# Runs as a normal user without admin privileges

function Get-DomainInfo {
    Write-Output "`n[+] Gathering Domain Information..."
    $Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
    Write-Output "Domain Name: $($Domain.Name)"
    Write-Output "Domain Controllers: $($Domain.DomainControllers)"
}

function Get-DomainUsers {
    Write-Output "`n[+] Enumerating Domain Users..."
    $Searcher = New-Object DirectoryServices.DirectorySearcher
    $Searcher.Filter = "(&(objectCategory=Person)(objectClass=User))"
    $Searcher.PageSize = 200
    $Users = $Searcher.FindAll()

    foreach ($User in $Users) {
        Write-Output "User: $($User.Properties.samaccountname)"
    }
}

function Get-DomainGroups {
    Write-Output "`n[+] Enumerating Domain Groups..."
    $Searcher = New-Object DirectoryServices.DirectorySearcher
    $Searcher.Filter = "(&(objectCategory=Group))"
    $Searcher.PageSize = 200
    $Groups = $Searcher.FindAll()

    foreach ($Group in $Groups) {
        Write-Output "Group: $($Group.Properties.cn)"
    }
}

function Get-DomainComputers {
    Write-Output "`n[+] Enumerating Domain Computers..."
    $Searcher = New-Object DirectoryServices.DirectorySearcher
    $Searcher.Filter = "(&(objectCategory=Computer))"
    $Searcher.PageSize = 200
    $Computers = $Searcher.FindAll()

    foreach ($Computer in $Computers) {
        Write-Output "Computer: $($Computer.Properties.cn)"
    }
}

function Get-LoggedInUsers {
    Write-Output "`n[+] Enumerating Logged-in Users..."
    $Sessions = quser 2>$null
    if ($Sessions) {
        $Sessions -split "`n" | ForEach-Object {
            if ($_ -match "^\s*(\S+)\s+(\S+)\s+(\S+)") {
                Write-Output "User: $matches[1] - Session: $matches[2] - State: $matches[3]"
            }
        }
    } else {
        Write-Output "[-] No active user sessions found."
    }
}

function Get-NetworkShares {
    Write-Output "`n[+] Enumerating Network Shares..."
    $Shares = net view /domain 2>$null
    if ($Shares) {
        Write-Output $Shares
    } else {
        Write-Output "[-] No accessible network shares found."
    }
}

# Execution
Write-Output "------------------------------------------------"
Write-Output "  "
Write-Output " Stealth Active Directory Enumeration Tool"
Write-Output "------------------------------------------------"
Write-Output "Running as user: $env:USERNAME"

Get-DomainInfo
Get-DomainUsers
Get-DomainGroups
Get-DomainComputers
Get-LoggedInUsers
Get-NetworkShares

Write-Output "`n[+] Enumeration Completed"
