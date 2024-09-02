# modules/ec2/main.tf

resource "aws_instance" "ssm_host" {
  ami           = "ami-066784287e358dad1"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     =  var.public_subnet

  tags = {
    Name = "ssm-host"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum install -y amazon-ssm-agent
              systemctl enable amazon-ssm-agent
              systemctl start amazon-ssm-agent
              EOF
}

resource "aws_instance" "server" {
  ami           = "ami-066784287e358dad1"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     =  var.public_subnet

  tags = {
    Name = "server"
  }
}

