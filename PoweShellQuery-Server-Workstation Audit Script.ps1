# Script Description: Identifies Server and Workstation Devices (Hostname, Operating Systen, OS Version and IP Address)
# Last modified by: Rudi Bartsch (rudib@b-logic.co.za)
# Last modified date: 19/07/2023
 
# Execute instructions: Right click and Run as Powershell.

#------------------------------------------------------------------------------------------
#                                 Declaring Dynamic Variables  
#                                 (Unique Per Client)
#------------------------------------------------------------------------------------------

# Editable: Declares variable which Parent OU to search (E.g: DC=Microsoft,DC=com or DC=contoso,DC=local):
$OutputServerList = "E:\B-Logic\ServerInfo.txt"
$OutputWorkstationList = "E:\B-Logic\WorkstationInfo.txt"

# Procedure Begin

#Retrieve all Windows Server Computer
Get-ADComputer -Filter 'operatingsystem -like "*server*" -and enabled -eq "true"' `
-Properties Name,Operatingsystem,OperatingSystemVersion,IPv4Address |
Sort-Object -Property Operatingsystem |
Select-Object -Property Name,Operatingsystem,OperatingSystemVersion,IPv4Address | Out-File $OutputServerList

#Retrieve all Windows Client Computer
Get-ADComputer -Filter 'operatingsystem -notlike "*server*" -and enabled -eq "true"' `
-Properties Name,Operatingsystem,OperatingSystemVersion,IPv4Address |
Sort-Object -Property Operatingsystem |
Select-Object -Property Name,Operatingsystem,OperatingSystemVersion,IPv4Address | Out-File $OutputWorkstationList

# Procedure End
