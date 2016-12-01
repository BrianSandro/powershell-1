# powershell useful scripts

Get-LockedOutUser.ps1 is an advanced script that returns a list of users who were locked out in Active Directory
by querying the event logs on the PDC emulation in the domain.
 
.FLAG UserName
    The userid of the specific user you are looking for lockouts for. The default is all locked out users.
 
.FLAG StartTime
    The datetime to start searching from. The default is all datetimes that exist in the event logs.
 
.EXAMPLE
    Get-LockedOutUser.ps1
 
.EXAMPLE
    Get-LockedOutUser.ps1 -UserName 'mike'
 
.EXAMPLE
    Get-LockedOutUser.ps1 -StartTime (Get-Date).AddDays(-1)
 
.EXAMPLE
    Get-LockedOutUser.ps1 -UserName 'miker' -StartTime (Get-Date).AddDays(-1)
