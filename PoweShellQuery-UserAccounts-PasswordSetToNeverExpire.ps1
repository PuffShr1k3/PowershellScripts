# Script Description: Identifies all user accounts that are enabled and set to password never expires in the domain.
# Last modified by: Rudi Bartsch (rudib@b-logic.co.za)
# Last modified date: 19/07/2023
 
# Execute instructions: Right click and Run as Powershell.


# Procedure BeginImport-Module ActiveDirectory 
get-aduser -filter * -properties Name, PasswordNeverExpires | where { $_.passwordNeverExpires -eq "true" } | where {$_.enabled -eq "true"} | Out-GridView

# Procedure End
