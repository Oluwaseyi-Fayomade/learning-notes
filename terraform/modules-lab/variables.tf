# variables.tf (root)
# Inputs to the ROOT config itself — filled in by you, via terraform.tfvars,
# -var on the CLI, or a TF_VAR_ environment variable. NOT the same thing as
# modules/hello/variables.tf, which are inputs to the MODULE, filled in by
# whichever config calls it (in our case, this root config).

variable "greeting_message" {
  description = "Message passed into the first module call."
  type        = string
  default     = "Hello from a module!"
}
