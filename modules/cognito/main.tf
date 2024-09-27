resource "aws_cognito_user_pool" "cpf_auth_pool" {
  name = "${var.project_name}-user-pool"

  schema {
    name                     = "cpf"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    required                 = false
    string_attribute_constraints {
      min_length = 11
      max_length = 11
    }
  }

  admin_create_user_config {
    allow_admin_create_user_only = true
  }
}