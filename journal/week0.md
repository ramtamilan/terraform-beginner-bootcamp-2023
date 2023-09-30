# Terraform Beginner Bootcamp 2023 - week 0

- [Semantic versioning](#semantic-versioning)
- [Install the Terraform CLI](#install-the-terraform-cli)
    + [Shebang](#shebang)
  * [Considerations for Linux Distrubution](#considerations-for-linux-distrubution)
  * [Refactoring into Bash Scripts](#refactoring-into-bash-scripts)
  * [Linux Permission Considerations](#linux-permission-considerations)
  * [Workspace tasks - Before,Init, Command](#workspace-tasks---beforeinit-command)
  * [Working Env Vars](#working-env-vars)
    + [env command](#env-command)
    + [Setting and Unsetting Env Vars](#setting-and-unsetting-env-vars)
    + [Printing Vars](#printing-vars)
    + [Scoping of Env Vars](#scoping-of-env-vars)
    + [Persisting Env Vars in Gitpod](#persisting-env-vars-in-gitpod)
  * [AWS CLI installation](#aws-cli-installation)
- [Terraform Basics](#terraform-basics)
  * [Terraform Registry](#terraform-registry)
- [Terraform Console](#terraform-console)
    + [Terraform Init](#terraform-init)
    + [Terraform Plan](#terraform-plan)
    + [Terraform Apply](#terraform-apply)
    + [Terraform Destroy](#terraform-destroy)
    + [Terraform Lock files](#terraform-lock-files)
    + [Terraform State files](#terraform-state-files)
    + [Terraform Directory](#terraform-directory)
    + [Issues with Terraform cloud login and Gitpod Workspace](#issues-with-terraform-cloud-login-and-gitpod-workspace)
  * [Git commands incase changes done in Main without branch](#git-commands-incase-changes-done-in-main-without-branch)

## Semantic versioning
This project is going utilize semantic versioning for its tagging.

[semver.org](semver.org)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

 3-refactor-terraform-cli
## Install the Terraform CLI

The Terraform CLI installation instructions have changed due ti gpg keyring changes. So we needed to refer latest cli instructions

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

#### Shebang

- format for bash: `#!/user/bin/env bash`



### Considerations for Linux Distrubution

This project is built against Ubuntu and change accordingly to distrubution needs
[How to check OS version](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)


### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg depreciation issue we notice that bash scripts were considerable amount more So we decided to create bash script to install the Terrform CLI.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

### Linux Permission Considerations

Change linux permission to fix executable at the user mode.

[Permissions](https://en.wikipedia.org/wiki/Chmod)

### Workspace tasks - Before,Init, Command

We need to be careful when using the Init because it will not rerun restart any existing workspace.


[Documentation for gitpod tasks](https://www.gitpod.io/docs/configure/workspaces/tasks)

### Working Env Vars

#### env command

We can list out all Environment variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terminal we can unset using `unset HELLO`


We can set an env var temporarily when just running a command

````sh
HELLO='world' ./bin/print_message
````
Within a bash script we can set env with out writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO 
````
#### Printing Vars

We can print an env var using echo eg. `echo $HELLO`


#### Scoping of Env Vars

When you open up new bash terminal in VSCDODE it will not be aware of env vars that you have set in another window

If you want the Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All future workspace launched will set the env vars for all bash terminal opened in workspaces.


You can also set en vars in the `.gitpod.yml` but this can only contain non-senistive env vars.

### AWS CLI installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)


[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI ENV VARS](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```

If it is successful you should see a json payload return that looks like below

```json

{
    "UserId": "AIDAXKVX34GSYGV5AAE3X",
    "Account": "123456789023",
    "Arn": "arn:aws:iam::123456789023:user/USER1"
}

```
We'll need to generate AWS CLI credits from IAM user in order to the user AWS CLI.


## Terraform Basics

### Terraform Registry

Terraform sources their providers and modules from the Terraforn registry which is located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs that will allow to create resources in terraform
- **Modules** are self-contained packages of Terraform configurations that are managed as a group, portable and sharable.

[Random Terraform Providers](https://registry.terraform.io/providers/hashicorp/random/latest)

## Terraform Console

We can see a list of all the Terraform commands by typing `terraform`

#### Terraform Init

`terraform init` prepares the working directory so Terraform can run the configuration.

#### Terraform Plan

**Plan** `terraform plan`lets you preview any changes before you apply them.

#### Terraform Apply

**Apply** `terraform apply` executes the changes defined by your Terraform configuration to create, update, or destroy resources. If we want to automatically approve apply we can provide the `terraform apply --auto-approve`

#### Terraform Destroy

This will destory the resources. eg `terraform apply --auto-approve`

#### Terraform Lock files

`.terraform.lock.hcl` contains the  locked versioning for the providers or modules that should be used with this project.

The Terraform lock file **should be committed** to your version control system (VSC) eg. Github

#### Terraform State files

`.terraform.tfstate` contain information about the current state of your infrastructure. 

This file **should not be committed** to your VCS.

This file can contain sensitive data. If you lose this file, you lose known state of the infrastructure .

`.terraform.tfstate.backup` is the previous state file state.

#### Terraform Directory

`.terraform` directory contains binaries of terraform providers

#### Issues with Terraform cloud login and Gitpod Workspace

When attempting to run `terraform login` it asks for token but there are no option to provide the token.
As a workaround, we had to edit the `credentials.tfrc.json` file and save the generated token.

```
[Terraform cloud token](https://app.terraform.io/app/settings/tokens?source=terraform-login)
```
Then create and open the file manually here:

```sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json
open /home/gitpod/.terraform.d/credentials.tfrc.json
```
Then add the following contents to the file

```
{
  "credentials": {
    "app.terraform.io": {
      "token": "Add Generated Token"
    }
  }
}
```

### Git commands incase changes done in Main without branch
```
git add .
git stash save
git fetch - to get branch
git checkout 'branchname'
git pull
git stash apply

```
We have automated the workaround with the bash script [bin/generate_tfrc_credentials](bin/generate_tfrc_credentials)
