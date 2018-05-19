terraform {
  backend "s3" {
    bucket = "ops-config-mgmt"
    region = "us-east-1"
    key = "terraform-state/infrastructure/api-gateway/custom-domain/terraform.tfstate"
  }
}


module "api_gw_custom_domain" {
  source = "github.com/ridegopher/aws-tf//api-gateway/custom-domain"
  tld_domain = "ridegopher.com"
  sub_domain = "api"
}

module "api_gw_dev_custom_domain" {
  source = "github.com/ridegopher/aws-tf//api-gateway/custom-domain"
  tld_domain = "ridegopher.com"
  sub_domain = "api-dev"
}
