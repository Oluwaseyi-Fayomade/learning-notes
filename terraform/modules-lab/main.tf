# main.tf (root module)

terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # this is the DEFAULT aws provider config
}

provider "aws" {
  alias  = "west"
  region = "us-west-2" # a SECOND aws provider config, distinct from the default
}

module "hello" {
  source = "./modules/hello"
  for_each = {
    first  = "Hello from instance one!"
    second = "Hello from instance two!"
    third  = "Hello from instance three!"
  }

  output_path = "${path.module}/${each.key}.txt"
  message     = each.value
}

# Explicitly telling this module instance to use the DEFAULT aws provider
module "region_east" {
  source = "./modules/region-info"
  providers = {
    aws = aws
  }
  output_path = "${path.module}/region-east.txt"
}

# Explicitly telling this module instance to use the ALIASED "west" provider
module "region_west" {
  source = "./modules/region-info"
  providers = {
    aws = aws.west
  }
  output_path = "${path.module}/region-west.txt"
}

# Consuming the SAME "hello" module logic, but this time from the PRIVATE
# registry (app.terraform.io) instead of a local path — proving the publish
# flow works end-to-end. Note the 4-segment source: <host>/<org>/<name>/<provider>.
module "hello_from_registry" {
  source  = "app.terraform.io/Willie-project/hello/local"
  version = "1.0.0"

  output_path = "${path.module}/hello-from-registry.txt"
  message     = "Hello from the private registry!"
}
