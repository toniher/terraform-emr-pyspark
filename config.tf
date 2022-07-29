
// State can be stored in a bucket
// terraform {
//  backend "s3" {
//    encrypt = true
//    bucket  = "terraform-persistence"
//    key     = "terraform-emr-pyspark.tfstate"
//    region  = "eu-central-1"
//  }
// }


provider "aws" {
  profile                 = var.profile
  shared_credentials_file = var.credentials
  region                  = var.region
}
