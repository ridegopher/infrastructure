terraform {
  backend "s3" {
    bucket = "ops-config-mgmt"
    region = "us-east-1"
    key = "terraform-state/infrastructure/cerficate-manager/terraform.tfstate"
  }
}

resource "aws_acm_certificate" "cert" {
  domain_name = "ridegopher.com"
  subject_alternative_names = [
    "www.ridegopher.com",
    "www-dev.ridegopher.com",
    "api.ridegopher.com",
    "api-dev.ridegopher.com"
  ]
  validation_method = "DNS"
}