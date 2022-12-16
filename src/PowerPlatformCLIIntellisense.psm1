$pacConfig = Get-Content "$(Split-Path -Path $MyInvocation.MyCommand.Path -Parent)\pac.json" | ConvertFrom-Json;
Register-ArgumentCompleter -Native -CommandName pac -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    $splitCommand = $commandAst.ToString().Split(" ").Trim();
    if ([string]::IsNullOrEmpty($wordToComplete)) {
        if ($commandAst.ToString() -eq "pac") {
            $pacConfig |
            ForEach-Object { [System.Management.Automation.CompletionResult]::new($_.name, $_.name, 'ParameterName', $_.description) };
        }
        elseif ($splitCommand.Length -eq 2) {
            $pacConfig |
            Where-Object { $_.name -eq $splitCommand[1] } |
            Select-Object -ExpandProperty subcommands |
            ForEach-Object { [System.Management.Automation.CompletionResult]::new($_.name, $_.name, 'ParameterValue', $_.description) };
        }
        elseif ($splitCommand.Length -ge 3) {
            $pacConfig | Where-Object { $_.name -eq $splitCommand[1] } |
            Select-Object -ExpandProperty subcommands |
            Where-Object { $_.name -match $splitCommand[2] } |
            Select-Object -ExpandProperty params |
            ForEach-Object { [System.Management.Automation.CompletionResult]::new($_.name, $_.name, 'ParameterValue', $_.description) };
        }
    }
    else {
        if ($commandAst.ToString() -eq "pac" -or $splitCommand.Length -eq 2) {
            $pacConfig | Where-Object { $_.name -like "$wordToComplete*" } |
            ForEach-Object { [System.Management.Automation.CompletionResult]::new($_.name, $_.name, 'ParameterName', $_.description) };
        }
        elseif ($splitCommand.Length -eq 3) {
            $pacConfig |
            Where-Object { $_.name -eq $splitCommand[1] } |
            Select-Object -ExpandProperty subcommands |
            Where-Object { $_.name -like "$wordToComplete*" } |
            ForEach-Object { [System.Management.Automation.CompletionResult]::new($_.name, $_.name, 'ParameterValue', $_.description) };
        }
        elseif ($splitCommand.Length -gt 3) {
            $pacConfig | Where-Object { $_.name -eq $splitCommand[1] } |
            Select-Object -ExpandProperty subcommands |
            Where-Object { $_.name -eq $splitCommand[2] } |
            Select-Object -ExpandProperty params |
            Where-Object { $_.name -like "*$wordToComplete*" } |
            ForEach-Object { [System.Management.Automation.CompletionResult]::new($_.name, $_.name, 'ParameterValue', $_.description) };
        }
    }
};