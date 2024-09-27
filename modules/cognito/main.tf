resource "aws_cognito_user_pool" "cpf_auth_pool" {
  name = "${var.project_name}-user-pool"

  alias_attributes = ["preferred_username"]

  admin_create_user_config {
    allow_admin_create_user_only = true
  }
}