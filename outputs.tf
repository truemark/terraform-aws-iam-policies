output "policies" {
  description = "A collection of files containing local policy definitions. These are JSON files residing in the policies directory relative to the command execution path."
  value = local.policies
}

output "created_policy_arns" {
  value = local.created_policy_arns
}

output "created_policy_ids" {
  value = local.created_policy_ids
}
