terraform {
  backend "s3" {
    bucket = "ops-config-mgmt"
    region = "us-east-1"
    key = "terraform-state/infrastructure/lambda-edge/terraform.tfstate"
  }
}

module "path_based_spa_edge" {
  source = "github.com/ridegopher/aws-tf//lambda-edge/path-based-spa"
}

output "path_based_spa_edge_arn" {
  value = "${module.path_based_spa_edge.arn}"
}

output "path_based_spa_edge_version" {
  value = "${module.path_based_spa_edge.version}"
}
