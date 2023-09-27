# Terraform Beginner Bootcamp 2023

## Semantic versioning:
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

### Workspace tasks (Before,Init, Command)

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
gitpod /workspace/terraform-beginner-bootcamp-2023 (7-refactor-aws-cli-script) $ aws sts get-caller-identity
{
    "UserId": "AIDAXKVX34GSYGV5AAE3X",
    "Account": "123456789023",
    "Arn": "arn:aws:iam::123456789023:user/USER1"
}

We'll need to generate AWS CLI credits from IAM user in order to the user AWS CLI.