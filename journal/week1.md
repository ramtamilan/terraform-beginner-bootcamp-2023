# Terraform Beginner Bootcamp 2023 - week 1

## Root Module Structure

Our root module structure is as follows:
```
PROJECT ROOT
|
├──main.tf             # Everything else
├──variables.tf        # stores the structure of input variables
├──terraform.tfvars    # the data of variables we want to load into our terraform project
├──providers.tf        # defines required providers and configurations
├──output.tf           # stores our outputs
└── README.md           # required for root modules
```


[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables
### Terraform Cloud Variables

In Terraform Cloud, we can set two variables:
- Environment Variables - those we set in bash terminal e.g. AWS credentials
- Terraform Variables - those that we normally set in tfvars file

We can set Terraform Cloud Variables to be sensitive so they are shown in UI.

### Loading Terraform Variables

[Input Variables documentation](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var`flag to set an input variable or override a variable in the tfvars file.

### var-file flag

-The -var-file flag is used to pass Input Variable values into Terraform plan and apply commands using a file that contains the values. eg `terraform apply -var-file=terraform.tfvars`


### terraform.tfvars

This is default file where we load value for terraform variables.

### auto.tfvars

The variables inside these files will be auto loaded during terraform plan or apply

### order of terraform  variables

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

* Environment variables
* The terraform.tfvars file, if present.
* The terraform.tfvars.json file, if present.
* Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
* Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)


