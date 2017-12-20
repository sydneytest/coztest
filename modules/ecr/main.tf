# Module to create super user policy

resource "aws_iam_policy" "superuser" {
  name        = "superuser_policy"
  path        = "/"
  description = "Super user policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}
