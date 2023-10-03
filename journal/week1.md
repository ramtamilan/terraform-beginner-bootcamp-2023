# Terraform Beginner Bootcamp 2023 - week 1

## Fixing Tags

[How to Delete Local and Remote Tags on Git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

Locall delete a tag
```sh
git tag -d <tag_name>
```

Remotely delete tag

```sh
git push --delete origin tagname
```

Checkout the commit that you want to retag. Grab the sha from your Github history.

```sh
git checkout <SHA>
git tag M.M.P
git push --tags
git checkout main
```

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

## Dealing with Configuration Drift

## What Happens if we lose our state file?

If you lose your state files, you most likely have to tear down all your cloud infrastructure manually.

You can use terraform import bt it won't for all resources. We would need to check the Terraform documenation for the resource.x`

`terraform import aws_s3_bucket.bucket bucket-name`

### Terraform Import

### Fix Missing Resources with Terraform Import

[Terraform import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 bucket import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If the resource is modified or deleted manually and if we run Terraform pla is with attempt to put our infrastructure back into the expected state fixing configurations drift.

## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structures

It is recommend to place modules in a `modules` directory when locally developing modules but you can name it whatever you like.

## Passing Input Variables

We can pass input variables to our module.
The modules has to declare the variables in its own variable.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

Using the source we can import the module from various places eg:
- locally
- Github
- Terraform registry

```
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```

[Module Sources docs](https://developer.hashicorp.com/terraform/language/modules/sources)

## Considerations when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the latest documentation or information about Terraform.

It may likely produce older examples that could be deprecated. Often affecting providers.

## Working with Files in Terraform


### Fileexists function

This is a built in terraform function to check the existance of a file.

```tf
condition = fileexists(var.error_html_filepath)
```

https://developer.hashicorp.com/terraform/language/functions/fileexists

### Filemd5

https://developer.hashicorp.com/terraform/language/functions/filemd5

### Path Variable

In terraform there is a special variable called `path` that allows us to reference local paths:
- path.module = get the path for the current module
- path.root = get the path for the root module
[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)


resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"
}

## Terraform Locals

Locals allows us to define local variables.
It can be very useful when we need transform data into another format and have referenced a varaible.

```tf
locals {
  s3_origin_id = "MyS3Origin"
}
```
[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)

## Terraform Data Sources

This allows use to source data from cloud resources.

This is useful when we want to reference cloud resources without importing them.

```tf
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```
[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

## Working with JSON

We use the jsonencode to create the json policy inline in the hcl.

```tf
> jsonencode({"hello"="world"})
{"hello":"world"}
```

[jsonencode](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

