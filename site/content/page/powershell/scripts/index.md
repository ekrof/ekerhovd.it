---
title: "Force Reboot 3AM"
date: 2022-09-12T14:57:34+01:00
draft: false
image: 
---

```powershell
shutdown /r /f /t ([math]::Round(((New-TimeSpan -start (get-date).AddDays(-1) -end (get-date -hour 03 -minute 0 -second 0 -format "HH:mm:ss"))).TotalSeconds))
```