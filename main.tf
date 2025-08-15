terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.34.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = ">= 2.0.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0.0"
    }
  }

  cloud {
    organization = "hcubesys-ltd"

    workspaces {
      name = "testinguat"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.AWS_ACCESS_KEY_ID    # optional, use environment variables in production
  secret_key = var.AWS_SECRET_ACCESS_KEY # optional, use environment variables in production
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.1.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  eks_managed_node_groups = {
    workers = {
      ami_type       = "AL2_x86_64"
      instance_types = [var.node_instance_types[0]]

      min_size     = var.min_capacity
      max_size     = var.max_capacity
      desired_size = var.desired_capacity

      tags = {
        Name = "${var.cluster_name}-worker"
      }
    }
  }

  providers = {
    aws = aws
  }
}
