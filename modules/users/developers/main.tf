# Terraform module for creating developer user

module "ecr" {
  source = "../../ecr"
}

module "s3" {
  source = "../../s3"
}

resource "aws_iam_user" "developer" {
  name = "developer-user"
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

resource "aws_iam_policy_attachment" "developer-attach1" {
  name       = "developer-attachment1"
  users      = ["${aws_iam_user.developer.name}"]
  policy_arn = "${aws_iam_policy.ecruser.arn}"
}

resource "aws_iam_policy_attachment" "developer-attach2" {
  name       = "developer-attachment2"
  users      = ["${aws_iam_user.developer.name}"]
  policy_arn = "${aws_iam_policy.s3user.arn}"
}
