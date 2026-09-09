# main.tf — this module needs the CALLER to tell it exactly which AWS
# provider configuration to use. "configuration_aliases" below declares
# that requirement — without it, a module just silently inherits whatever
# default "aws" provider the root defined, with no way to pick a different one.
terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws]
    }
  }
}

data "aws_region" "current" {}

resource "local_file" "region_note" {
  filename = var.output_path
  content  = "This module instance is using AWS region: ${data.aws_region.current.name}"
}
