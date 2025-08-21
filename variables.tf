# AWS Credentials (use environment variables in Terraform Cloud for security)
variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
  default     = null
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
  default     = null
}

# AWS region
variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

# EKS cluster variables
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS nodes"
  type        = list(string)
}

variable "node_instance_types" {
  description = "EC2 instance types for EKS node groups"
  type        = list(string)
}

variable "min_capacity" {
  description = "Minimum size of the EKS node group"
  type        = number
}

variable "max_capacity" {
  description = "Maximum size of the EKS node group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired size of the EKS node group"
  type        = number
}

variable "AWS_DEFAULT_REGION" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1" # optional
}