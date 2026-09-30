#powershell
# Script to create and enable a new Active Directory user
# Author: Igor Bordushko

$Password = ConvertTo-SecureString "SuperSecret123!" -AsPlainText -Force

New-ADUser -Name "Anna Smirnova" -SamAccountName "a.smirnova" -UserPrincipalName "a.smirnova@salem.local" -Path "OU=Accounting,DC=salem,DC=local" -AccountPassword $Password -Enabled $true
