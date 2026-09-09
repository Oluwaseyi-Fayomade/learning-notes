# variables.tf — the module's "function arguments."
# The caller (root module) must supply these when it calls this module.

variable "output_path" {
  description = "Where the greeting file should be written."
  type        = string
}

variable "message" {
  description = "The text to write into the file."
  type        = string
}
