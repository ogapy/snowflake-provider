locals {
  github_actions_oidc_arn = "arn:aws:iam::${var.aws_account_id}:oidc-provider/token.actions.githubusercontent.com"
  github_org              = "ogapy"
  github_repo             = "snowflake-terraform"
}

resource "aws_iam_openid_connect_provider" "github_actions-ogawa" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}
