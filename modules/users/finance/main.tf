# Terraform module for creating finance user

module "billing" {
  source = "../../billing"
}

resource "aws_iam_user" "finance" {
  name = "finance-user"
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

resource "aws_iam_policy_attachment" "finance-attach" {
  name       = "finance-attachment"
  users      = ["${aws_iam_user.finance.name}"]
  policy_arn = "${aws_iam_policy.billinguser.arn}"
}
