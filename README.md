# 🚀 Oracle Cloud Free Tier — Managed Kubernetes (OKE) Lab with Terraform

Este repositório provisiona um cluster **OKE** (Oracle Kubernetes Engine) **100% gratuito**, usando recursos **Always Free** da Oracle Cloud.

## 📌 O que este projeto faz

- Cria a VCN e subnets necessárias
- Cria um cluster gerenciado OKE
- Cria pools de nós com shape **A1.Flex ARM** compatível com Always Free
- Configura tudo usando **Terraform**

## ⚙️ Pré-requisitos

- Conta Oracle Cloud com **Always Free Tier** habilitado
- Chave API OCI criada ([docs oficiais](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm))
- Tenancy OCID, User OCID, Fingerprint e caminho da chave privada

## 📂 Estrutura dos arquivos

| Arquivo | Descrição |
|------------------------|-------------------------------------------|
| `providers.tf` | Configura o provider OCI |
| `variables.tf` | Define as variáveis de ambiente |
| `terraform.tfvars.example` | Exemplo de variáveis sensíveis (NÃO subir `terraform.tfvars` real) |
| `network.tf` | Cria a VCN e subnets |
| `availability-domains.tf` | Lê ADs da OCI |
| `kubernetes.tf` | Define o cluster OKE |
| `main.tf` | Junta tudo |
| `versions.tf` | Trava versões do Terraform e do provider OCI |

## 🚀 Como usar

1️⃣ Clone este repo:
```bash
git clone https://github.com/SEU_USUARIO/oci-oke-terraform-lab.git
cd oci-oke-terraform-lab
```

2️⃣ Crie o arquivo `terraform.tfvars` com seus dados:
```hcl
tenancy_ocid     = "ocid1.tenancy.oc1..EXAMPLE"
user_ocid        = "ocid1.user.oc1..EXAMPLE"
fingerprint      = "xx:xx:xx:xx:xx"
private_key_path = "~/.oci/oci_api_key.pem"
region           = "sa-saopaulo-1"
compartment_ocid = "ocid1.compartment.oc1..EXAMPLE"
```

3️⃣ Inicialize o Terraform:
```bash
terraform init
```

4️⃣ Veja o plano:
```bash
terraform plan
```

5️⃣ Aplique:
```bash
terraform apply
```

## ✅ Dicas importantes

- Verifique no console da OCI **as imagens compatíveis com o shape A1.Flex**
- Confirme se o par de chaves SSH está correto para acessar os nós
- Use **apenas os recursos do Always Free** para não gerar custos

## 🧩 Baseado em

- [OCI Official Docs](https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengoverview.htm)
- [Post Digital Nostril](https://blog.digitalnostril.com/post/create-free-managed-kubernetes-cluster-in-oracle-cloud/)

## ⚡️ Licença

MIT — use à vontade, contribua e compartilhe!
