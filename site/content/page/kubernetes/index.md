---
title: "Kubernetes"
description: My collection of favorite kubernetes commands
image: 
math: 
license: 
hidden: false
comments: false
draft: false
toc: true
menu: 
    main:
        name: kubernetes
        weight: -40
        params:
            icon: kubernetes
---
> ℹ️ Protip: Add an alias in your terminal for kubectl to save time using kubernetes CLI

**Powershell Alias**
```powershell
Set-Alias -Name k -Value kubectl
```
**WSL/Linux Alias**

Add the following lines in your ~/.bashrc file to apply alias
```bash
alias k='kubectl'
# Autocomplete
source <(k completion bash | sed s/kubectl/k/g)
```
And reload bashrc after applying with the following command:
```bash
. ~/.bashrc 
# OR source ~/.bashrc
# OR exec bash
```
## Kubectl run small busybox instance for debugging

```zsh
kubectl run -i --tty --rm alpine --image=alpine -- sh

#Enter pod after deployment

kubectl exec -i --tty busybox -- sh
```

## MSSQL Tools
```zsh
kubectl run -i mssql-tools --image=mcr.microsoft.com/mssql-tools

sqlcmd -S {SERVER_IP} -d {DB_NAME} -U {DB_USERNAME} -P {DB_PASSWORD}
```

## Troubleshoot K8S networking with Netshoot
```zsh
kubectl run --rm -i --tty debug --image=nicolaka/netshoot --restart=Never -- curl -H "Host: mysite.com" http://{Ingress_IP} -v
```

## Troubleshoot flux reconciliation
```zsh
kubectl get kustomizations.kustomize.toolkit.fluxcd.io -A

flux get ks -A 
```

## Kubectl unseal secret
```zsh
kubectl get secret -n {NS_NAME} {SECRET_NAME} -o jsonpath='{.data.vault-root}'|base64 -d
```

## Kubectl see all verbs
```zsh
kubectl api-resources --no-headers --sort-by name -o wide | sed 's/.*\[//g' | tr -d "]" | tr " " "\n" | sort | uniq
```
