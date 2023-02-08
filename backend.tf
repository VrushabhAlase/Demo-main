terraform {
  backend "s3" {
    bucket = "as1506-terraform-state"
    key    = "s3-state-file"
    region = "ap-south-1"
  }
}
