# Script Description: Identifies Active Directory computer accounts that are disabled
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

# Editable: Declares variable which Parent OU to search (E.g: DC=Microsoft,DC=com or DC=contoso,DC=local):
$SearchDomain = Read-Host 'Enter the domain: Example: for the domain "contoso.local"; Input: DC=contoso,DC=local'
#$SearchDomain = 'DC=ms,DC=lab,DC=local'

#------------------------------------------------------------------------------------------
#                          DO NOT EDIT SCRIPT BEYOND THIS POINT  
#------------------------------------------------------------------------------------------


## Output to a Gridview pop up box that can be copied and pasted to an excel spreedsheet while maintaining the tab formatting. 
##Note: If there is no output, that means there is no stale accounts meeting the criteria that was input into the Declaring Dynamic Variable section.
Search-ADAccount –AccountDisabled –UsersOnly -SearchBase $SearchDomain  | Out-GridView 

# Procedure End
