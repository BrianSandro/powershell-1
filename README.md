## powershell useful scripts

######[get-lockedout-user.ps1] (https://github.com/blastik/powershell/blob/master/get-lockedout-user.ps1)

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
    
    
######[get-inactive-users.ps1] (https://github.com/blastik/powershell/blob/master/get-inactive-users.ps1)

Export the users that didnt log into the AD for 180 days in a file called inactive-users.csv 

######[get-inactive-wks.ps1] (https://github.com/blastik/powershell/blob/master/get-inactive-wks.ps1)

Export the workstations that didnt log into the AD for 90 days in a file called inactiveWorkstations.txt 

######[get-accounts-notexpire.ps1] (https://github.com/blastik/powershell/blob/master/get-accounts-notexpire.ps1)

Export the user accounts on which the passwords are set NOT to expire in a file called users-psw-noexpire.csv

######[Get-OldOrQuarantinedDevices.ps1] (https://github.com/blastik/powershell/blob/master/Get-OldOrQuarantinedDevices.ps1)

Lo list all the devices that were not synced for more than 30days or are Quarantined in Exchange Online.

You can adjust AddDays("-30") with the number of days that the device hasn't been synced. To remove them use: (https://github.com/blastik/powershell/blob/master/Remove-OldOrQuarantinedDevices.ps1)

######[Get-IMAPandPOPEnabled.ps1] (https://github.com/blastik/powershell/blob/master/Get-IMAPandPOPEnabled.ps1)

To list the users that has IMAP and/or POP enabled.
Exported in .\imapenabled.txt. 
After that you should remove header and white spaces at the end of the lines. Then run (https://github.com/blastik/powershell/blob/master/DisableIMAPandPOP.ps1) if you wish to disable POP and IMAP for all of them.
