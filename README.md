# Power Platform CLI - Code Completion

Add Code Completion on Power Platform CLI using PowerShell. [PAC JSON config file](./PowerPlatformCLIAutoComplete/pac.json) correct as of Power Platform CLI version 1.21.4+g4869036.

# Installation

```powershell
Install-Module -Name PowerPlatformCLIAutoComplete -AllowPrerelease; Import-Module -Name PowerPlatformCLIAutoComplete;
```
If you have organization restrictions for installing PowerShell modules globally, install it in the scope of the current user like below.

```powershell
Install-Module -Name PowerPlatformCLIAutoComplete -Scope CurrentUser; Import-Module -Name PowerPlatformCLIAutoComplete;
```

Once you have installed the module, add the `Import-Module` to your PowerShell profile. Open your profile in PowerShell by running the command below.

```
notepad $profile
```

Then add this line in the end to import the auto-complete module.

```powershell
Import-Module -Name PowerPlatformCLIAutoComplete
```
Below is a sample PowerShell profile that I use.

```powershell
Import-Module posh-git
Import-Module oh-my-posh
Import-Module DockerCompletion
Set-Theme paradox
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Import-Module -Name PowerPlatformCLIAutoComplete
```

This will ensure that you will get auto-complete for Power Platform CLI everytime your start a new PowerShell terminal.
