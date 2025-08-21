output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "cluster_name" {
  value = module.eks.cluster_id
}

output "worker_node_group_names" {
  value = keys(module.eks.eks_managed_node_groups)
}
