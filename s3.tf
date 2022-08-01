resource "aws_s3_bucket" "image_storage_bucket" {
    bucket = "lambda-lab-talent-academy-bucket"

    tags = {
        Name = "lambda-lab-talent-academy-bucket"
        Environment = "Lab"
    }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.image_storage_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.lab_lambda_image_rekognition.arn
    events              = ["s3:ObjectCreated:*"]
  }
}