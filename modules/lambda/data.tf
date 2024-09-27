data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/../../src/authenticate.py"
  output_path = "${path.module}/authenticate.zip"
}