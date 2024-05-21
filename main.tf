provider "aws" {
    region = "us-east-1"
    access_key = "<accesskey>"
    secret_key = "<secret access key>"
    
  
}
resource "aws_iam_user" "tuser" {
    name = "tuser"
     tags = {
       name="tfuser"
     }
  
}
resource "aws_iam_access_key" "keys" {
    user = aws_iam_user.tuser.name

}
resource "aws_iam_policy" "tfpolicy" {
    name = "tfpolicy"
     policy= <<EOF
     {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": [
            "s3:ListAllMyBuckets"
        ],
        "Effect": "Allow",
        "Resource": "*"
        }]
     }
    EOF
}

resource "aws_iam_user_policy_attachment" "policyattach" {
    user = aws_iam_user.tuser.name
    policy_arn = aws_iam_policy.tfpolicy.arn
  
}



  
