module "cognito" {
  source               = "./modules/cognito"
  project_name         = local.project_name
}

module "lambda" {
  source               = "./modules/lambda"
  project_name         = local.project_name
  cognito_user_pool_id = module.cognito.user_pool_id
}

module "api_gateway" {
  source               = "./modules/api_gateway"
  project_name         = local.project_name
  lambda_invoke_arn    = module.lambda.lambda_invoke_arn
  lambda_function_name = module.lambda.lambda_function_name
}