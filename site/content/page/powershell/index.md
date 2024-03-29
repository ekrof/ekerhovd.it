---
title: "Powershell"
description: My collection of favorite PowerShell scripts
image: 
math: 
license: 
hidden: false
comments: false
draft: false
toc: true
menu: 
    main:
        name: PowerShell
        weight: -50
        params:
            icon: powershell
---

## Reboot (3am) oneliner:

```powershell
shutdown /r /f /t ([math]::Round(((New-TimeSpan -start (get-date).AddDays(-1) -end (get-date -hour 03 -minute 0 -second 0 -format "HH:mm:ss"))).TotalSeconds))
```

## Reboot w/Scheduled task

```powershell
$action =
New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-NoProfile
-WindowStyle Hidden -command "& {Restart-Computer -Force -wait}"'
$trigger =
New-ScheduledTaskTrigger -Once -At 3am
Register-ScheduledTask
-Action $action -Trigger $trigger -TaskName 'ScheduledReboot'
```

## Find last reboot

```powershell
get-eventlog System | where-object {$_.EventID -eq "6005"} | sort -desc TimeGenerated
```
