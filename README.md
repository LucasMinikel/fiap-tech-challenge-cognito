# fiap-tech-challenge-cognito


aws s3api create-bucket --bucket minikel-cognito-tfstate --region sa-east-1 --create-bucket-configuration LocationConstraint=sa-east-1


{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"lambda:*",
				"apigateway:*",
				"cognito-idp:*"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"iam:GetRole",
				"iam:PassRole",
				"iam:CreateRole",
				"iam:DeleteRole",
				"iam:PutRolePolicy",
				"iam:AttachRolePolicy",
				"iam:DetachRolePolicy",
				"iam:ListRolePolicies",
				"iam:ListAttachedRolePolicies",
				"iam:ListInstanceProfilesForRole"
			],
			"Resource": "arn:aws:iam::*:role/*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"logs:CreateLogGroup",
				"logs:CreateLogStream",
				"logs:PutLogEvents"
			],
			"Resource": "arn:aws:logs:*:*:*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"s3:GetObject",
				"s3:PutObject",
				"s3:ListBucket"
			],
			"Resource": [
				"arn:aws:s3:::minikel-cognito-tfstate",
				"arn:aws:s3:::minikel-cognito-tfstate/*"
			]
		}
	]
}