#
# Variable Declarations
#
variable "tfc_org" {}
variable "git_org" {}
variable "git_repo" {}
variable "github_oauth_token" {}
variable "tfe_token" {}
variable "publickey" {}
variable "azure_client" {}
variable "azure_client_secret" {}
variable "azure_subscription" {}
variable "azure_tenant" {}
locals {
    target_branch = terraform.workspace

    tfcvars = {
        "publickeyfile" = {
            value       = var.publickey
            category    = "terraform"
            hcl         = false
            sensitive   = true
            description = "public key used to setup the virtual machines in the build"
        }
        "specification_name" = {
            value       = terraform.workspace
            category    = "terraform"
            hcl         = false
            sensitive   = false
            description = "the name of a map containing parameters for the environment build"
        }
        "ARM_CLIENT_ID" = {
            value       = var.azure_client
            category    = "env"
            hcl         = false
            sensitive   = true
            description = "Azure Client ID"
        }
        "ARM_CLIENT" = {
            value       = var.azure_client
            category    = "terraform"
            hcl         = false
            sensitive   = true
            description = "Azure Client ID"
        }
        "ARM_CLIENT_SECRET" = {
            value       = var.azure_client_secret
            category    = "env"
            hcl         = false
            sensitive   = true
            description = "Azure Client Secret"
        }
        "ARM_CLIENT_SECRETS" = {
            value       = var.azure_client_secret
            category    = "terraform"
            hcl         = false
            sensitive   = true
            description = "Azure Client Secret"
        }
        "ARM_SUBSCRIPTION_ID" = {
            value       = var.azure_subscription
            category    = "env"
            hcl         = false
            sensitive   = true
            description = "Azure Resource Subscription"
        }
        "ARM_SUBSCRIPTION" = {
            value       = var.azure_subscription
            category    = "terraform"
            hcl         = false
            sensitive   = true
            description = "Azure Resource Subscription"
        }
        "ARM_TENANT_ID" = {
            value       = var.azure_tenant
            category    = "env"
            hcl         = false
            sensitive   = true
            description = "Azure Resource Tenant"
        }
        "ARM_TENANT" = {
            value       = var.azure_tenant
            category    = "terraform"
            hcl         = false
            sensitive   = true
            description = "Azure Resource Tenant"
        }
    }
}
