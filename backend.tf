
# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io"
#     organization = ""
#     workspaces {
#       name = ""
#     }
#   }
# }
terraform {
  backend "local"{}
}