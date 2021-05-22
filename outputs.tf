locals {
  files = fileset(path.module, "policies/*.json")
  policies = {
  for file in local.files: replace(file, "/.*\\/(.*).json/", "$1") => file("${path.module}/${file}")
  }
}

output "policies" {
  value = local.policies
}
