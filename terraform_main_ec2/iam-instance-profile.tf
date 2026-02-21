resource "aws_iam_instance_profile" "instance-profile" {
  name = "ec2-profile"
  role = aws_iam_role.iam-role.name
}
