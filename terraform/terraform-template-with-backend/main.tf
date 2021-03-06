provider "aws" {
  region = "us-east-2"
}

terraform {
    backend "remote" {
        organization = "example-organization"

        # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
            name = "example-workspace"
        }
    }
}


resource "null_resource" "example" {
    triggers = {
        value = "A example resource that does nothing!"
    }
}