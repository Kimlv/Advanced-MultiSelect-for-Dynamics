﻿#
# This script connects to a Dynamics CRM/365 instance/organization 
# and imports both 'AdvancedMultiSelectForDynamics' and 'DemoForAdvancedMultiSelect' MANAGED solutions there
#  

try{
  Clear-Host 
  $error.clear()
  $invokationFolder = $PSScriptRoot
  Import-Module ("$invokationFolder\CommonLib.ps1")
  $conn = Build-CrmConnection -InteractiveMode -Verbose
  $solutionFolder = "$invokationFolder\Solutions\"
  $version = "2.2.1.1"
  Import-AdvancedMultiSelectSolutions -CrmConn $conn -Managed -Version $version -OverwriteUnManagedCustomizations -Verbose
}

catch [Exception] {
  throw $_.Exception
}