# Module to create billing user policy

resource "aws_iam_policy" "billinguser" {
  name        = "billinguser_policy"
  path        = "/"
  description = "Billing user policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "aws-portal:*Billing",
                "aws-portal:*Usage",
                "aws-portal:*PaymentMethods",
                "budgets:ViewBudget",
                "budgets:ModifyBudget"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
