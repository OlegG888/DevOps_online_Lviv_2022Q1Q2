terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "devops-2022-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "repository" {
  source = "./modules/repository"
}

module "ci_cd" {
  source = "./modules/cicd"

  ecr_repository_arn = module.repository.ecr_repository_arn
}

module "hosting" {
  source = "./modules/hosting"

  ecr_repository_arn = module.repository.ecr_repository_arn
}
