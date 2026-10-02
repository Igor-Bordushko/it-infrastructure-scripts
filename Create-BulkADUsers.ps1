# Script to bulk create Active Directory users from an array
# Author: Igor Bordushko

$NewUsers = @(
    @{ Name = "Ivan Ivanov"; Login = "i.ivanov"; Title = "Manager"; OU = "OU=Accounting,DC=salem,DC=local" },
    @{ Name = "Petr Petrov"; Login = "p.petrov"; Title = "Engineer"; OU = "OU=IT_Department,DC=salem,DC=local" },
    @{ Name = "Elena Popova"; Login = "e.popova"; Title = "HR Specialist"; OU = "OU=Accounting,DC=salem,DC=local" }
)

$Password = ConvertTo-SecureString "Start!12345" -AsPlainText -Force

foreach ($User in$NewUsers) {
    New-ADUser -Name $User.Name `
               -SamAccountName $User.Login `
               -UserPrincipalName "$($User.Login)@salem.local" `
               -Title $User.Title `
               -Path $User.OU `
               -AccountPassword $Password `
               -Enabled $true
}
