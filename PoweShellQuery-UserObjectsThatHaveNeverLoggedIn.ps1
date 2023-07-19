# Script Description: Identifies Active Directory user accounts that are enabled and that have never logged in.
# Last modified by: Rudi Bartsch (rudib@b-logic.co.za)
# Last modified date: 19/07/2023
 
# Execute instructions: Right click and Run as Powershell.


# Procedure Begin

# Imports the Active Directory Module in powershell. (Do not edit.)
Import-Module ActiveDirectory 


#------------------------------------------------------------------------------------------
#                                 Declaring Dynamic Variables  
#                                 (Unique Per Client)
#------------------------------------------------------------------------------------------

# Editable: Declares variable that determines how many days the account must be inactive for, from the current date, before it is classified as stale:
$DaysInactive = Read-Host 'Enter the of days that the account is stale for?'

# Editable: Declares variable which Parent OU to search (E.g: DC=Microsoft,DC=com or DC=contoso,DC=local):
$SearchDomain = Read-Host 'Enter the domain: Example: for the domain "contoso.local"; Input: DC=contoso,DC=local'


#------------------------------------------------------------------------------------------
#                          DO NOT EDIT SCRIPT BEYOND THIS POINT  
#------------------------------------------------------------------------------------------


Get-ADUser -SearchBase $SearchDomain -Filter {-not (lastlogontimestamp -like "*") -and (enabled -eq $true)} |

## Output to a Gridview pop up box that can be copied and pasted to an excel spreedsheet while maintaining the tab formatting. 
##Note: If there is no output, that means there is no stale accounts meeting the criteria that was input into the Declaring Dynamic Variable section.
select-object Name,DistinguishedName,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp).ToString('yyyy-MM-dd_hh:mm:ss')}} | Out-GridView

#To output to a csv file, remove the '#' from the next fron of the following ine and insert a '# in front of the above line.
#select-object Name,DistinguishedName,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp).ToString('yyyy-MM-dd_hh:mm:ss')}} | Export-csv "C:\ListOfUserThatNeverLoggedIn.csv"

# Procedure End
