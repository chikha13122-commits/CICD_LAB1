# Yêu cầu Terraform tự đi tìm AMI của Ubuntu 22.04 mới nhất
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Mã ID chính thức của hãng Canonical (cha đẻ Ubuntu)
}

resource "aws_instance" "web" {
  # SỬA DÒNG NÀY: Lấy ID từ block data ở trên
  ami           = data.aws_ami.ubuntu.id 
  
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.web_sg.id]
  
  # CẢNH BÁO TIẾP THEO: Nếu bạn chưa tạo Key Pair tên là "my-aws-key" trên AWS
  # thì Terraform sẽ lại báo lỗi tiếp. 
  # Tạm thời bạn có thể comment dòng này lại bằng dấu # nếu chưa cần SSH vội:
  # key_name = "my-aws-key"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install docker.io -y
              systemctl start docker
              EOF

  tags = {
    Name = "DevOpsJourneyServer"
  }
}
