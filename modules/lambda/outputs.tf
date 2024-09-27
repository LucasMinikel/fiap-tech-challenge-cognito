output "lambda_invoke_arn" {
  value = aws_lambda_function.cpf_auth_lambda.invoke_arn
}

output "lambda_function_name" {
  value = aws_lambda_function.cpf_auth_lambda.function_name
}