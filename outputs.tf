output "api_gateway_invoke_url" {
  value = module.api_gateway.invoke_url
}

output "cognito_user_pool_id" {
  value = module.cognito.user_pool_id
}