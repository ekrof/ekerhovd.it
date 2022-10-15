---
title: Troubleshooting Windows AD join on Azure with Terraform"
description: Recently, I experienced some issues when attempting to use terraform to join a Windows VM to an on-prem domain using JsonADDomain extension. In this post, we'll examine the most frequent approaches of solving this issue in both Azure and Terraform.
date: 2022-10-15T13:19:11+02:00
image: frontpage.png
math: 
license: 
hidden: false
comments: true
draft: false
categories:
    - Azure
    - IaC
---

```terraform
resource "azurerm_virtual_machine_extension" "vm_adjoin" {
  name                 = "vm-adjoin"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"

  settings = <<SETTINGS
    {
        "Name": "yourdomain.net",
        "OUPath": "OU=Servers,OU=Resources,DC=yourdomain,DC=net",
        "User": "admin@yourdomain.net",
        "Restart": "true",
        "Options": "3"
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
        "Password": "${data.azurerm_key_vault_secret.adjoin.value}"
    }
  PROTECTED_SETTINGS

```

## Paragraph

Xerum, quo qui aut unt expliquam qui dolut labo. Aque venitatiusda cum, voluptionse latur sitiae dolessi aut parist aut dollo enim qui voluptate ma dolestendit peritin re plis aut quas inctum laceat est volestemque commosa as cus endigna tectur, offic to cor sequas etum rerum idem sintibus eiur? Quianimin porecus evelectur, cum que nis nust voloribus ratem aut omnimi, sitatur? Quiatem. Nam, omnis sum am fac