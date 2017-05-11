#########################################################
#Your Business Name Here User Security Audit Report
#########################################################

############################################
#Created by Brad Voris
############################################

############################################
#Import Active Directory Module
############################################

import-module activedirectory

############################################
#Run Active Directory Query
############################################
$users =  Get-ADUser -filter * -Properties * | Select SamAccountName,SurName,GivenName,Description,PasswordExpired,PasswordLastSet,AccountLockoutTime,AccountExpirationDate,LastLogonDate,@{name=”MemberOf”;expression={$_.memberof -join “;”}} | ConvertTo-Html

#HTML Heading
$htmlhead = @"
<HEAD>
<TITLE>Your Business Name Here User Security Report</TITLE>
<style>
table {
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
}
</style>
</HEAD>
"@
#HTML Body for report
$htmlbody = @"
<CENTER><Font size=5><B>Your Business Name Here User Security Audit Report</B></font></BR><Font size=4><B>User Audit Report</B></font></BR><Font size=3>$dated<BR /><TABLE cellpadding="10"><TR bgcolor= #FEF7D6><TD>User Audit Security Report</TD></TR><TR bgcolor= #D9E3EA><TD>$users</TD></TR></TABLE></CENTER></font>"@
#Date for file name variable
$fileDate = get-date -uformat %Y-%m-%d
#Report output & location
ConvertTo-HTML -head $htmlhead -body $htmlbody | Out-File C:\AuditReport-$fileDate.html