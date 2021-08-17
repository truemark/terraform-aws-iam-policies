locals {
  files = fileset(path.module, "policies/*.json")
  policies = {
  for file in local.files: replace(file, "/.*\\/(.*).json/", "$1") => file("${path.module}/${file}")
  }
}

output "policies" {
  description = "A collection of files containing local policy definitions. These are JSON files residing in the policies directory relative to the command execution path."
  value = local.policies
}
