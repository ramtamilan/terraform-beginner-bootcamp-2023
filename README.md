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