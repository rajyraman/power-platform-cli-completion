# Power Platform CLI - Code Completion

Add Code Completion on Power Platform CLI using PowerShell. PAC [JSON](./PowerPlatformCLIAutoComplete/pac.doc.json) file is from pac release [1.27.6](https://www.nuget.org/packages/Microsoft.PowerApps.CLI/1.27.6) released on 20-September-2023.

# Installation

```powershell
Install-Module -Name PowerPlatformCLIAutoComplete; Import-Module -Name PowerPlatformCLIAutoComplete;
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
Import-Module PSReadLine
Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Import-Module -Name PowerPlatformCLIAutoComplete
Import-Module F7History
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/cloud-native-azure.omp.json" | Invoke-Expression
```

This will ensure that you will get auto-complete for Power Platform CLI everytime your start a new PowerShell terminal.
