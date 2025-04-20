terraform {
    backend "s3" {
        bucket = "myfirstbackend"
        key = "terraform.tfstate"
        region = "us-east-2"
    }
    required_providers {
        tfe = {
            version = "~>0.64.0"
        }
    }
}
provider "tfe" {
    version = "~>0.64.0"
}
resource "tfe_workspace" "test" {
    name = "my_second_workspace"
    organization = "029DA-DevOps24"
}
resource "tfe_workspace_settings" "test-settings" {
    workspace_id = tfe_workspace.test.id
    execution_mode = "local"
}
