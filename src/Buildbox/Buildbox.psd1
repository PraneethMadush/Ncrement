#
# Module manifest for module 'PSGet_Buildbox'
#
# Generated by: Ackara
#
# Generated on: 10/17/2017
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Buildbox'

# Version number of this module.
ModuleVersion = '3.0.17'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'bb97ee6a-ee54-49ae-9aa1-fc6f3c97b507'

# Author of this module
Author = 'Ackara'

# Company or vendor of this module
CompanyName = 'Ackara'

# Copyright statement for this module
Copyright = 'Released under the MIT license.'

# Description of the functionality provided by this module
Description = 'A collection of powershell scripts and modules designed for continuous builds and deployments.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.5.2'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = '.\Lib\Acklann.Buildbox.Versioning.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = '*'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = '*'

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
        LicenseUri = 'https://github.com/Ackara/Buildbox/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Ackara/Buildbox'

        # A URL to an icon representing this module.
        IconUri = 'http://static.acklann.com/images/buildbox.svg'

        # ReleaseNotes of this module
        ReleaseNotes = ' version 2.0.2
-------------
* Remove winscp module.
* Remove flyway module.
* Remove wawsdploy module.
* Move wawsdeploy and flyway cmdlets to the utils module.

version 1.5.2
* Rename namespaces.

version 1.5.1
-------------
* Add Get-BranchSuffix cmdlet.

version 1.4.1
-------------
* Add Find-MSBuildPath cmdlet.

version 1.3.9
-------------
* Add ability to parse settings file where the values are nested within another object.

version 1.2.8
-------------
* Add Write-LineBreak cmdlet
* Add Show-Inputbox cmdlet

Fixes
* Stop DotNetCoreProjectFileHandler from append the version suffix.
* Stop Update-VersionNumber from saving the config file after it made a commit.

version 1.1.2
-------------
* Fix semver settings file not being saved when a custom file is used.

version 1.1.1
-------------
* Add UsecommitMessageAsDescription switch to Update-VersionNumber cmdlet

version: 1.0.1
----------------
* Add utils modules

Changes
* Rename VersionInfo.ReleaseTag field to ''Suffix"
* Rename Settings.ReleaseTag to ''branchSuffixMap''

version: 0.1.111
----------------
* Add flyway module
* Add winscp module
* Add waswsdeploy module
* Add semver module

version: 0.0.1
--------------
Initial release'

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

