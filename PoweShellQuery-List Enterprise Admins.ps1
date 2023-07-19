# Script Description: Identifies all Enterprise administrators in the domain.
# Last modified by: Rudi Bartsch (rudib@b-logic.co.za)
# Last modified date: 19/07/2023
 
# Execute instructions: Right click and Run as Powershell.


# Procedure BeginImport-Module ActiveDirectory 
Import-Module ActiveDirectory 

## Output to a Gridview pop up box that can be copied and pasted to an excel spreedsheet while maintaining the tab formatting. 
##Note: If there is no output, that means there is no stale accounts meeting the criteria that was input into the Declaring Dynamic Variable section.

get-adgroupmember -Identity "Enterprise Admins" | Out-GridView
#To output to a csv file, remove the '#' from the next front of the following ine and insert a '# in front of the above line.
#get-adgroupmember -Identity "Enterprise Admins" | Export-csv "C:\List of Domain Admins.csv"

# Procedure End
