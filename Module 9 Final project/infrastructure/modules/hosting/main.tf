data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "hosting" {
  key_name   = "hosting"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "aws_instance" "hosting" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t4g.small"
  associate_public_ip_address = true
  disable_api_termination     = true
  vpc_security_group_ids      = [aws_security_group.allow_hosting.id]
  user_data                   = file("${path.module}/user-data.sh")
  key_name                    = aws_key_pair.hosting.key_name
  iam_instance_profile        = aws_iam_instance_profile.hosting.name

  tags = {
    Name = var.name_tag
  }
}

resource "aws_security_group" "allow_hosting" {
  name = "allow_hosting"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.name_tag
  }
}

resource "aws_iam_role" "hosting" {
  name = "hosting_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = var.name_tag
  }
}

resource "aws_iam_policy" "hosting" {
  name = "hosting_policy"
  path = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer"
        ]
        Effect   = "Allow"
        Resource = var.ecr_repository_arn
      },
      {
        Action = [
          "ecr:GetAuthorizationToken"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "hosting" {
  role       = aws_iam_role.hosting.name
  policy_arn = aws_iam_policy.hosting.arn
}

resource "aws_iam_instance_profile" "hosting" {
  name = "hosting_profile"
  role = aws_iam_role.hosting.name
}

resource "local_sensitive_file" "ssh_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "hosting"
  file_permission = "0400"
}
