# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "remote" {
    organization = "esmail-elmoussel"

    workspaces {
      name = "sample-app"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
  }

  required_version = ">= 1.2.0"
}
