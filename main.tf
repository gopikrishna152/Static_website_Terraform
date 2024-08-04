# resource "aws_s3_bucket" "MyBucket" {
#     bucket =  var.bucketname

# }

#  resource "aws_s3_bucket_ownership_controls" "example" {
#    bucket = aws_s3_bucket.MyBucket.id
#    rule {
#      object_ownership = "BucketOwnerPreferred"
#    }
#  }

#  resource "aws_s3_bucket_public_access_block" "example" {
#    bucket = aws_s3_bucket.MyBucket.id

#    block_public_acls       = false
#    block_public_policy     = false
#    ignore_public_acls      = false
#    restrict_public_buckets = false
#  }
#  resource "aws_s3_bucket_acl" "example" {
#    depends_on = [
#      aws_s3_bucket_ownership_controls.example,
#      aws_s3_bucket_public_access_block.example,
#    ]
   

#    bucket = aws_s3_bucket.MyBucket.id
#    acl    = "public-read"
#  }

#  resource "aws_s3_object" "index" {
    
#      bucket = aws_s3_bucket.MyBucket.id
#      key = "index.html"
#      source = "./html/index.html"
#      acl = "public-read"
#      content_type = "text/html"
#  }




#  resource "aws_s3_bucket_website_configuration" "website" {
#      bucket = aws_s3_bucket.MyBucket.id
#      index_document {
#          suffix = "index.html"
#      }
#      error_document {
#          key = "error.html"
#      }
#      depends_on = [ aws_s3_bucket_acl.example ]

#  }
#  # Upload HTML files
# resource "aws_s3_object" "html_files" {
#   for_each = fileset("./html", "*.html")
#   bucket   = aws_s3_bucket.MyBucket.id
#   key      = each.value
#   source   = "./html/${each.value}"
#   etag     = filemd5("./html/${each.value}")

#   acl      = "public-read"
# }

# # Upload CSS files
# resource "aws_s3_object" "css_files" {
#   for_each = fileset("./html/css", "*.css")
#   bucket   = aws_s3_bucket.MyBucket.id
#   key      = each.value
#   source   = "./html/css/${each.value}"
#   etag     = filemd5("./html/css/${each.value}")

#   acl      = "public-read"
# }


# resource "aws_s3_object" "png_files" {
#   for_each = fileset("./html/images", "*.png")
#   bucket   = aws_s3_bucket.MyBucket.id
#   key      = each.value
#   source   = "./html/images/${each.value}"
#   etag     = filemd5("./html/images/${each.value}")

#   acl      = "public-read"
# }
# # Upload JS files
# resource "aws_s3_object" "js_files" {
#   for_each = fileset("./html/js", "*.js")
#   bucket   = aws_s3_bucket.MyBucket.id
#   key      = each.value
#   source   = "./html/js/${each.value}"
#   etag     = filemd5("./html/js/${each.value}")

#   acl      = "public-read"
# }

# output "website_url" {
#   value = aws_s3_bucket.MyBucket.website_endpoint
# }




resource "aws_s3_bucket" "MyBucket" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.MyBucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.MyBucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.MyBucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.MyBucket.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.example]
}

# Upload HTML files
resource "aws_s3_object" "html_files" {
  for_each = fileset("./html", "*.html")
  bucket   = aws_s3_bucket.MyBucket.id
  key      = each.value
  source   = "./html/${each.value}"
  acl      = "public-read"
  content_type = "text/html"
}

# Upload CSS files
resource "aws_s3_object" "css_files" {
  for_each = fileset("./html/css", "*.css")
  bucket   = aws_s3_bucket.MyBucket.id
  key      = "css/${each.value}"
  source   = "./html/css/${each.value}"
  acl      = "public-read"
  content_type = "text/css"
}

# Upload JS files
resource "aws_s3_object" "js_files" {
  for_each = fileset("./html/js", "*.js")
  bucket   = aws_s3_bucket.MyBucket.id
  key      = "js/${each.value}"
  source   = "./html/js/${each.value}"
  acl      = "public-read"
  content_type = "application/javascript"
}

# Upload PNG files
resource "aws_s3_object" "png_files" {
  for_each = fileset("./html/images", "*.png")
  bucket   = aws_s3_bucket.MyBucket.id
  key      = "images/${each.value}"
  source   = "./html/images/${each.value}"
  acl      = "public-read"
  content_type = "image/png"
}

output "website_url" {
  value = aws_s3_bucket.MyBucket.website_endpoint
}
