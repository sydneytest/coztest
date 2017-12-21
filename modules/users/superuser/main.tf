# Terraform module for creating super user

module "superuser" {
  source = "../../superuser"
}

resource "aws_iam_user" "superuser" {
  name = "super-user"
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

resource "aws_iam_policy_attachment" "superuser-attach" {
  name       = "superuser-attachment"
  users      = ["${aws_iam_user.superuser.name}"]
  policy_arn = "${aws_iam_policy.superuser.arn}"
}
