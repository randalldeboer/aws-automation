terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-montpellier"
    key    = "state"
    region = "eu-central-1"
  }
}