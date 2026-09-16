terraform {
  cloud {
    organization = "Willie-project"

    workspaces {
      name = "state-lab"
    }
  }
}

resource "random_id" "main" {
  byte_length = 4
}

resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep 20"
  }
}

resource "local_file" "example" {
  filename = "hello.txt"
  content  = "hello from terraform state lab"
}