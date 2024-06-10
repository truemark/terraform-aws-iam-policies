locals {
  files = fileset(path.module, "policies/*.json")
  policies = {
    for file in local.files : replace(file, "/.*\\/(.*).json/", "$1") => file("${path.module}/${file}")
  }
}

resource "aws_iam_policy" "this" {
  for_each = toset(var.create_policies)
  name     = each.key
  policy   = local.policies[each.key]
}

locals {
  created_policy_arns = {
    for policy in aws_iam_policy.this : policy.name => policy.arn
  }
  created_policy_ids = {
    for policy in aws_iam_policy.this : policy.name => policy.id
  }
}
