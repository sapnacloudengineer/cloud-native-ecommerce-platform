terraform {
  backend "s3" {
    bucket = "devops-project--sd-2026"
    key    = "terraform/state/terraform.tfstate"
    region = "ap-south-1"
  }
}
