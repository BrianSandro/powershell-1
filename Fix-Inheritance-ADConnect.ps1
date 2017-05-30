Import-Module ActiveDirectory
Add-PSSnapin Microsoft.Exchange.Management.Powershell.E2010

$object = import-csv "C:\IMPORT\FixTheseAccounts.csv"

foreach ( $user in $object ) {

    $perms  = Get-ADPermission "DC=clouduccino,DC=com" -user "MSOL_ABCDEF123456"

    foreach ($perm in $perms) {

      write-host "User                :" $user.DistinguishedName
      write-host "Identity            :" $perm.User
      write-host "AccessRights        :" $perm.AccessRights
      write-host "Properties          :" $perm.Properties
      write-host "InheritedObjectType :" $perm.InheritedObjectType
      write-host "InheritanceType     :" $perm.InheritanceType

      Add-ADPermission $user.DistinguishedName `
        -user $perm.User `
        -AccessRights $perm.AccessRights `
        -Properties $perm.Properties `
        -InheritedObjectType $perm.InheritedObjectType `
        -InheritanceType $perm.InheritanceType | out-null
        
    }

}