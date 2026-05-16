terraform {
  backend "s3" {
    bucket = "gitops-terraformstate-argocd"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}