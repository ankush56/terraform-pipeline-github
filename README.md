# Terraform Github Actions Pipeline
## Create Repo
## Create workflow for terraform. 
```
githubrepo>actions>configure workflow-> select terraform predefined
```
**This will create terraform.yml file at /.github/workflows/terraform.yml**

**Create Service principal in Azure(ARM_CLIENT_ID)**
>   You need to create an Azure service principal to run Terraform in GitHub Actions.

>   Run the following command to create the service principal and grant it Contributor access to the Azure subscription.

```
az ad sp create-for-rbac --name "sp-hello-azure-tf" --role Contributor --scopes /subscriptions/<subscription-id> --sdk-auth

```
**Configure Azure env variables**
> Set these as secrets in github repo secrets


```
jobs:
  terraform:
    name: 'Terraform'
    runs-on: ubuntu-latest
    environment: dev
    env:
      ARM_CLIENT_ID: <client-id>
      ARM_CLIENT_SECRET: ${{secrets.TF_ARM_CLIENT_SECRET}}
      ARM_SUBSCRIPTION_ID: <subscription-id>
      ARM_TENANT_ID: <tenant-id>
```

**Create storage account in Azure**
**Configure storage account in backend.tf this will be used by terraform to store states**
Example-
```
provider "azurerm" {
  version = "=2.0.0"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-hello-azure-tf"
    storage_account_name = "sahelloazuretf"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}

```

**Create the repository secret**
>   The final step of the GitHub repo configuration is creating the TF_ARM_CLIENT_SECRET secret referenced by the workflows.

> Navigate to the repository Settings page, then select Secrets in the left nav. Create a new secret TF_ARM_CLIENT_SECRET using the client secret value





