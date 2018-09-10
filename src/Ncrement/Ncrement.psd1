#
# Module manifest for module 'PSGet_Ncrement'
#
# Generated by: Ackara and Contributors
#
# Generated on: 9/9/2018
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '5.0.9'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '332b06ed-278e-482a-b17c-98919e43f577'

# Author of this module
Author = 'Ackara and Contributors'

# Company or vendor of this module
CompanyName = 'Acklann'

# Copyright statement for this module
Copyright = 'Released under the MIT license.'

# Description of the functionality provided by this module
Description = 'A library for applying semantic versioning to your projects.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
ScriptsToProcess = 'Private\Add-NcrementTypes.ps1'

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('Private\Assert-GitIsInstalled.ps1', 
               'Private\Edit-NetCoreProjectFile.ps1', 
               'Private\Edit-NetFrameworkProjectFile.ps1', 
               'Private\Edit-PackageJsonFile.ps1', 
               'Private\Edit-PSManifestFile.ps1', 
               'Private\Edit-VSIXManifestFile.ps1', 
               'Private\Test-GitRepository.ps1', 
               'Public\Convert-NcrementManifestToNugetTokens.ps1', 
               'Public\Convert-NcrementVersionNumberToString.ps1', 
               'Public\Get-NcrementManifest.ps1', 
               'Public\New-NcrementManifest.ps1', 
               'Public\Save-NcrementManifest.ps1', 
               'Public\Step-NcrementVersionNumber.ps1', 
               'Public\Step-NcrementVersionNumberUsingDate.ps1', 
               'Public\Update-NcrementProjectFile.ps1')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Convert-NcrementManifestToNugetTokens', 
               'Convert-NcrementVersionNumberToString', 'Get-NcrementManifest', 
               'New-NcrementManifest', 'Save-NcrementManifest', 
               'Step-NcrementVersionNumber', 'Step-NcrementVersionNumberUsingDate', 
               'Update-NcrementProjectFile'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'build','automation','continous','deployment','vsts'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/Ackara/Ncrement/blob/master/license.txt'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Ackara/Ncrement'

        # A URL to an icon representing this module.
        IconUri = 'https://github.com/Ackara/Ncrement/raw/master/art/icon.png'

        # ReleaseNotes of this module
        ReleaseNotes = 'https://github.com/Ackara/Ncrement/blob/master/releaseNotes.txt'

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

