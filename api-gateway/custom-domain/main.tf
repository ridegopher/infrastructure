terraform {
  backend "s3" {
    bucket = "ops-config-mgmt"
    region = "us-east-1"
    key = "terraform-state/infrastructure/api-gateway/custom-domain/terraform.tfstate"
  }
}

variable "domain" {
  default = "ridegopher.com"
}

data "aws_route53_zone" "zone" {
  name = "${var.domain}."
}

data "aws_acm_certificate" "tld" {
  domain = "${var.domain}"
  most_recent = true
  types = ["AMAZON_ISSUED"]
}

module "api_gw_custom_domain" {
  source = "github.com/ridegopher/aws-tf//api-gateway/custom-domain"
  domain = "${var.domain}"
  sub_domain = "api"
  zone_id = "${data.aws_route53_zone.zone.zone_id}"
  cert_arn = "${data.aws_acm_certificate.tld.arn}"
}

module "api_gw_dev_custom_domain" {
  source = "github.com/ridegopher/aws-tf//api-gateway/custom-domain"
  domain = "${var.domain}"
  sub_domain = "api-dev"
  zone_id = "${data.aws_route53_zone.zone.zone_id}"
  cert_arn = "${data.aws_acm_certificate.tld.arn}"
}
