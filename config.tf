
// State can be stored in a bucket
terraform {
  required_version = ">=0.14"
  //  backend "s3" {
  //    encrypt = true
  //    bucket  = "terraform-persistence"
  //    key     = "terraform-emr-pyspark.tfstate"
  //    region  = "eu-central-1"
  //  }
}


provider "aws" {
  profile                 = var.profile
  shared_credentials_file = var.credentials
  region                  = var.region
}

// Random resource for naming
resource "random_string" "rand" {
  length  = 8
  special = false
}
