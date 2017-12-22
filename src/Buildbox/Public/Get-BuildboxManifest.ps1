<#
.SYNOPSIS
This function creates a new [Manifest] instance from the specified path.

.DESCRIPTION
This function will create a new [Manifest] instance from the given path. If no path is given the funtion will search the current directory for a 'manifest.json' file; Passing a path to a directory will also invoke the same behavior.

.PARAMETER Path
The path of the manifest file.

.INPUTS
System.String

.OUTPUTS
Manifest

.EXAMPLE
Get-BuildboxManifest;
This example creates a new [Manifest] from the 'manifest.json' file withing the current directory.

Get-BuildboxManifest "C:\newproject\manifest.json";
This example creates a new [Manifest] from the specified path.
#>
function Get-BuildboxManifest()
{
	Param(
		[Alias('p')]
		[Parameter(ValueFromPipeline)]
		[string]$Path = "$PWD\manifest.json"
	)

	if ([string]::IsNullOrEmpty($Path))
	{
		return  [Manifest]::new();
	}
	elseif (Test-Path $Path -PathType Leaf)
	{
		return [Manifest]::Load($Path);
	}
	elseif (Test-Path $Path -PathType Container)
	{
		return [Manifest]::Load("$Path\manifest.json");
	}
	else
	{
		throw "Cannot find file at '$Path'.";
	}
}

#region ----- Classes -----

class Version
{
	[int]$Major = 0;
	[int]$Minor = 0;
	[int]$Patch = 1;
	[string]$Suffix = "";

	[string] ToString()
	{
		return "$($this.Major).$($this.Minor).$($this.Patch)";
	}
}

class Manifest
{
	Manifest()
	{
		$this.ProductName = "Your Product Name";
		$this.Id = "CompanyName.ProductName";
		$this.Version = [Version]::new();
		$this.Authors = $env:USERNAME;
		$this.Description = "A useful description.";
		$this.Tags = "tag1 tag2";

		$this.Owner = $env:USERNAME;
		$this.Copyright = "All Rights Reserved.";

		$this.BranchSuffixMap = @{
			"master"="";
			"*"="beta";
		};
	}

	hidden [string]$Path;

	[string]$Id;
	[Version]$Version;
	[string]$ProductName;
	[string]$Description;
	[string]$Authors;

	[string]$Tags;
	[string]$Owner;
	[string]$Copyright;

	[string]$IconUri;
	[string]$LicenseUri;
	[string]$ProjectUrl;
	[string]$RepositoryUrl;

	$BranchSuffixMap = @{};

	static [Manifest] Load($path)
	{
		$json = (Get-Content $path | Out-String | ConvertFrom-Json);
		$manifest = [Manifest]::new();
		$manifest.Id = $json.id;
		$manifest.Tags = $json.tags;
		$manifest.Owner = $json.owner;
		$manifest.Authors = $json.Authors;
		$manifest.Version = $json.version;
		$manifest.IconUri = $json.iconUri;
		$manifest.LicenseUri = $json.licenseUri;
		$manifest.Description = $json.description;
		$manifest.RepositoryUrl = $json.repositoryUrl;
		$manifest.ProductName = $json.productName;
		$manifest.ProjectUrl = $json.projectUrl;
		$manifest.Copyright = $json.copyright;

		$map = @{};
		foreach ($property in $json.branchSuffixMap.PSObject.Properties)
		{
			$map.Add($property.Name, $property.Value);
		}
		$manifest.BranchSuffixMap = $map;
		return $manifest;
	}

	[void] Save()
	{
		$clone = $this | ConvertTo-Json | ConvertFrom-Json;
		$nullProperties = $clone.Psobject.Properties | Where-Object {$_.Value -EQ $null} | Select-Object -ExpandProperty Name;
		foreach ($property in $nullProperties)
		{
			$clone.Psobject.Properties.Remove($property);
		}
		$clone.Psobject.Properties.Remove("Path");
		$clone | ConvertTo-Json | Out-File $this.Path -Encoding utf8;
	}

	[string] GetVersionSuffix([string]$branchName)
	{
		if ($this.BranchSuffixMap.ContainsKey($branchName))
		{
			return $this.BranchSuffixMap[$branchName];
		}
		elseif ($this.BranchSuffixMap.ContainsKey("*"))
		{
			return $this.BranchSuffixMap["*"];
		}
		else
		{
			return $null;
		}
	}

	
}
#endregion