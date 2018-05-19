terraform {
  backend "s3" {
    bucket = "ops-config-mgmt"
    region = "us-east-1"
    key = "terraform-state/infrastructure/s3-replicated/terraform.tfstate"
  }
}

module "s3_for_cdn" {
  source = "github.com/ridegopher/aws-tf//s3/replicated"
  bucket_name = "ridegopher-cross-region"
}