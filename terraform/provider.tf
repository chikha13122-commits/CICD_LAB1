terraform {
  # Khai báo các provider (plugin) mà project này cần dùng
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Sử dụng phiên bản AWS provider 5.x mới nhất
    }
  }
}

# Cấu hình chi tiết cho provider aws
provider "aws" {
  # Nơi bạn muốn tạo server. ap-southeast-1 là khu vực Singapore (gần VN, mạng sẽ nhanh)
  region = "ap-southeast-1" 
  
  # (Tùy chọn) Nếu bạn dùng lệnh `aws configure` với profile khác mặc định thì thêm dòng này:
  profile = "default" 
}
