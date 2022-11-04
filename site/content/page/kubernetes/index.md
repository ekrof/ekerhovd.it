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
