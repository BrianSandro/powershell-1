## powershell useful scripts

######Get-LockedOutUser.ps1 

Returns a list of users who were locked out in Active Directory
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
    
    
######get-inactive-users.ps1

Export the users that didnt log into the AD for 180 days in a file called inactive-users.csv 

######get-inactive-wks.ps1

Export the workstations that didnt log into the AD for 90 days in a file called inactiveWorkstations.txt 

######get-accounts-notexpire.ps1

Export the user accounts on which the passwords are set NOT to expire in a file called users-psw-noexpire.csv
