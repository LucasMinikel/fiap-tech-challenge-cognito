resource "aws_cognito_user_pool" "cpf_auth_pool" {
  name = "${var.project_name}-user-pool"

  schema {
    name                = "custom:cpf"
    attribute_data_type = "String"
    mutable             = true
    required            = false
  }
}