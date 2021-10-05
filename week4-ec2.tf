data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]

  }
}


resource "aws_instance" "automation-vm" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.automation-sub-a.id
  vpc_security_group_ids = [aws_security_group.automation-ssh-sg.id]
  key_name               = "week3-ssh"
  iam_instance_profile   = aws_iam_instance_profile.automation-profile.name 

  tags = {
    Name = "automation-vm"
  }
}

resource "aws_iam_instance_profile" "automation-profile" {
  name = "automation-profile"
  role = aws_iam_role.automation-role.name
  tags = {}
}
