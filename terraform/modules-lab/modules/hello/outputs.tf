# outputs.tf — the module's "return value(s)."
# The caller can read this back after using the module.

output "file_path" {
  description = "Path of the file this module created."
  value       = local_file.greeting.filename
}
