<h1 style="text-align:center"> FN-Herstal </h1> 

<p align="center" style="background-color:white; padding:40px 0">
  <img src="https://upload.wikimedia.org/wikipedia/commons/5/5d/FN-Herstal-logo.svg" alt="Logo FN-Herstal">
</p>

## FQDN 

- fnherstal-terraform.final.cfai24.ajformation.fr | 2a03:5840:111:1024:b121:13ff:feea:0000 
- fnherstal-terraform.vitrineweb.cfai24.ajformation.fr | 2a03:5840:111:1024:b121:13ff:feea:0001
- fnherstal-terraform.adminweb.cfai24.ajformation.fr | 2a03:5840:111:1024:b121:13ff:feea:0002
- fnherstal-terraform.bdd.cfai24.ajformation.fr | 2a03:5840:111:1024:b121:13ff:feea:0003

## Equipe :
- NOM : FN Herstal
- url projet : [Git FN-Herstal](https://github.com/CFAI2024-CPLR/FN-Herstal).
- les complices :
    - name : Mattéo Charrin
        - login : mcharrin
        - ssh_key : 
        ```shell
        ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAmwznEFu7njNh0+Gzs/pqJcsINoUJfWYgGvmhd0xt5aPfITZ3nljkBT7xvo499SRWAl+Gs1GyuJSWdF/JTZe6Fbd+ww99MF4B1Not6BDMLpRBa6NQfPaezdFrENsWpKrN+fc50d59BgyYj9PBJx6SI0qVcO/L6/Cw1+NTl9byseLMxVg7rTOWb0+xd+lt8h9cqC1T8z+9QhPvjH1/0LDODz7Cp4VygZmMINn5DDK8nDJ6WSJu6OYPpxqohMYsNPgsHoO8by/Gi9LH8Bo/puMNVqFbNe5DE4Tkk+/ADPbw49GoHRQKNF2rD5XmPaEssCSksHvI1yyy8zRaAer1piDduw== rsa-key-20240524
        ```
    - name : Nolan COLLARD
        - login : ncollard
        - ssh_key : 
        ```shell
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICOpR0lWG+yeVSy0GuF+T31fdMQJHJ2snpjDZsQ+N1bx
        ```
    - name : Mathéo Fleuret
        - login : mfleuret
        - ssh_key :
        ```shell
        rsa-key-20240524 AAAAB3NzaC1yc2EAAAADAQABAAABAQCQK3HfBM1DCoSrQSlmKY12o2jxqQ+Z9tAGHHbaEuCCd41nyj5+77/nutvWhmPZ0SmLt1hcPyMHcpU46fP0/l7j4uiuiWkNPOIyixLNows6R76EwKuDIP+2F43DzULl960vGoDBff1BIpanM9LkFaR51eXJUL1HC4U++15suS1q/tIV3gXkIdBLCAjrijLdBkrctICsZLYEVQw2vUANcqa7+qDP7Thpn1Rz41ZSCmRmx4c7NupEHlhUkotoYo2qDq9K7+MpBDwASM7ZrQkw1UjsXzUY/W0K5oo4f7IMWsXhnAtU8nl61n2IHzR3thMCXwYywm2XcyQnM6C1AX2j5kBf
        ```
- professeur :
    - name : Jérôme Avond
        - login : javond
        - ssh_ley : 
        ```shell
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBnoxKR7llvIC zepZokSb2FyqO69BVCiFAWKTULE4bL jerome@djay
        ```
        
## Création d'un conteneur debian 

> - Ip machine :  2a03:5840:111:1024:b121:13ff:feea:0000 
> - FQDN : fnherstal-terraform.final.cfai24.ajformation.fr

### Creation des utilisateur 
On crée les différents utilisateurs <br />
Puis on leur ajoute leur clé SSH publique <br />
On fini par leur donne les droit sudo 
 
### Outil installer sur la machine : 
- Sudo
- Terraform 
- Ansible
- Environement venv 

### Mise en place de l'environement : 

Création d'un dossier projet dans le dossier /home/projet

#### Mis en place de Terraform 

On viens copier les différents fichier a partir d'un git pull de https://github.com/CFAI2024-CPLR/terraform/

Puis on les modifie pour coller au demande. 

On ajout donc une variable ipv6 afin de donner une ip static aux différents conteneurs 

##### Fichier nodes.auto.tfvars.json
```json
"ipv6address": "2a03:5840:111:1024:b121:13ff:feea:0002/64"
```

de plus on modifie les les autres fichiers pour pouvori traiter cette nouvelle demande 

##### Fichier container.tf
```tf
  network {
    ip6 = each.value.ipv6address
  }
```

##### Fichier variable.tf 
```tf

variable containers {
type = list(object({
    ipv6address = string
}))
default = [{
    ipv6address = "2a03:5840:111:1024:b121:13ff:feea:1000" 
}]
}
```
---
#### Ansible 

Commande pour lancer les playbook ansibles
```shell 
 sudo ansible-playbook -i inventory playbook/bdd.yaml -vvv
 sudo ansible-playbook -i inventory playbook/site.yaml -vvv
```