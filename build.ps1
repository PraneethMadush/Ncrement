<#
.SYNOPSIS
This is a [psake]() bootstrap script designed to be run on a windows machine or a [VSTS]() enviroment.
#>

Param(
	[string[]]$Tasks = @("default"),

	[Alias("s")]
	[hashtable]$Secrets = @{},

	[Alias('t')]
	[string]$TestName = "",

	[Alias("c")]
	[ValidateSet("Debug", "Release")]
	[string]$BuildConfiguration = "Release",

    [Alias("n", "nuget")]
    [string]$NugetVersion = "latest",
	
	[Alias("sc")]
	[switch]$SkipCompilation,

	[switch]$Major,
	[switch]$Minor,
	[switch]$Help,
	[switch]$Commit,
	[switch]$InteractiveMode
)

Write-Host "user: $env:USERNAME";
Write-Host "machine: $env:COMPUTERNAME";
Write-Host "configuration: $BuildConfiguration";

# Assign Variables
$branchName = $env:BUILD_SOURCEBRANCHNAME;
if ([string]::IsNullOrEmpty($branchName))
{
	$results = (& git branch);
	$regex = New-Object Regex('\*\s*(?<name>\w+)');
	if ($regex.IsMatch($results)) { $branchName = $regex.Match($results).Groups["name"].Value; }
}
Write-Host "branch: '$branchName'";

# Restore packages
$nuget = "$PSScriptRoot\tools\NuGet\$NugetVersion\nuget.exe";
if (-not (Test-Path $nuget -PathType Leaf))
{
	$nugetDir = Split-Path $nuget -Parent;
	if (-not (Test-Path $nugetDir -PathType Container)) { New-Item $nugetDir -ItemType Directory | Out-Null; }
	Invoke-WebRequest https://dist.nuget.org/win-x86-commandline/$NugetVersion/nuget.exe -OutFile $nuget;
}

& $nuget restore "$((Get-Item "$PSScriptRoot\*.sln").FullName)" | Out-Null;

# Invoke Psake
Get-Item "$PSScriptRoot\packages\psake*\tools\psake.psd1" | Import-Module -Force;
$taskFile = "$PSScriptRoot\build\tasks.ps1";

if ($Help) { Invoke-psake -buildFile $taskFile -docs; }
else
{
	Write-Host "";
	Invoke-psake $taskFile -taskList $Tasks -nologo -notr `
		-properties @{
			"Nuget"=$nuget;
			"Secrets"=$Secrets;
			"TestName"=$TestName;
			"BranchName"=$branchName;
			"Major"=$Major.IsPresent;
			"Minor"=$Minor.IsPresent;
			"Commit"=$Commit.IsPresent;
			"BuildConfiguration"=$BuildConfiguration;
			"SkipCompilation"=$SkipCompilation.IsPresent;
			"InteractiveMode"=$InteractiveMode.IsPresent;
		}

    if(-not $psake.build_success) { exit 1; }
}
