provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_ecrpublic_repository" "ecr" {
  provider = aws.us_east_1

  repository_name = var.name

  catalog_data {
    about_text        = "About Text"
    architectures     = ["ARM"]
    description       = "Description"
    operating_systems = ["Linux"]
    usage_text        = "Usage Text"
  }
}
