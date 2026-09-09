# main.tf — the module's actual resource(s).
resource "local_file" "greeting" {
  filename = var.output_path
  content  = var.message
}
