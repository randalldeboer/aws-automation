resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-099dfee16f9ed13df"
  instance_type = "t3.micro"
}

# main.tf
resource "aws_s3_bucket" "montpellier" {
  bucket = "montpellier"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-montpellier"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

data "aws_secretsmanager_secret_version" "database_password" {
  secret_id = "my-database-password-montpellier"
}

resource "aws_db_instance" "my_secret_db" {
  identifier        = "rds-db-instance"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0.43"
  instance_class    = "db.t3.micro"
  username          = "admin"
  password          = data.aws_secretsmanager_secret_version.database_password.secret_string  # Using the retrieved secret value
}

