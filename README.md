## Provision Terraform Cloud Workspaces for use with F5 BIG-IP & Terraform Cloud demo
the demo repository can be found at https://github.com/f5devcentral/terraform-cloud-azure-bigip-demo

The word *workspace* is overloaded in this README due to HashiCorp naming. It's suggested that you read [this](https://www.terraform.io/docs/cloud/workspaces/index.html) to understand the differences between Terraform Cloud workspaces and workspaces with the Terraform command line. 

We'll be using Terraform command line workspaces to create and manage the state of Terraform Cloud Workspaces.

|This repo|Demo Repo|Terraform Cloud|
|---------|:-------:|---------------|
|has a workspace named x|has a branch named x|creates a workspace named Demo-Repo-x|

### Setup tfvars file
You should copy the *terraform.tfvars.example* file to *terraform.tfvars*. Before replacing the dummy values with the values of your own, take a minute or two to review the *.gitignore* file. In particular, 

```bash
# Ignore any .tfvars files that are generated automatically for each Terraform run. Most
# .tfvars files are managed as part of configuration and so should be included in
# version control.
#
# example.tfvars
*.tfvars
```
You should see that by default we're ignoring tfvars files, assuming they may contain sensitive data. You may place your copy outside of the repository directory as an additional step of security and refer to it using a [*-var-file*](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files) option at the command line. 

Now you can update your tfvars file, using the guidance provided by the comments from the example file.

### Setup command line workspaces
As mentioned earlier this repository uses command line workspaces to manage parallel workspaces. For the purpose of the demo, we're creating production, test, and development workspaces to replicate a simplified operations workflow. In a real world scenario you may have seperate repositories for each environment rather than branches in one repository. 

If you are planning to operate this demo in a similar fashion, create branches for each environment in your demo repository (not this one). For example, for the production branch you would;
```
git checkout -b production
git push origin production
```
Once you've created the branches and pushed them to origin, you'll create the corresponding command line workspaces. For example, for the production branch you would
```
terraform workspace new production
```
Once all of the local workspaces have been created you're ready to perform the final step of creating the Terraform Cloud Workspaces.

Before we start with that final step, take a few minutes to review the *main.tf* and *variables.tf* to see how sensitive information flags are being set. This is important so that the value of these variables do not show up in clear text in the Terraform Cloud UI.

Do the following for each of the workspaces you just created. We're using *production* as an example.
```
terraform workspace select production

terraform apply
```
If the variables and branches are setup properly, the terraform apply will complete successfully and you should be able to log into Terraform Cloud and use your workspaces.