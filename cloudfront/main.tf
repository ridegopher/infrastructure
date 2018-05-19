terraform {
  backend "s3" {
    bucket = "ops-config-mgmt"
    region = "us-east-1"
    key = "terraform-state/infrastructure/cloudfront/terraform.tfstate"
  }
}

module "cloudfront" {
  source = "github.com/ridegopher/aws-tf//cloudfront"
  tld_domain = "ridegopher.com"
  cnames = ["ridegopher.com", "www.ridegopher.com"]
}

resource "aws_s3_bucket_object" "object" {
  bucket = "${module.cloudfront.bucket_name}"
  key = "index.html"
  source = "index.html"
  content_type = "text/html"
  etag = "${md5(file("index.html"))}"
}
