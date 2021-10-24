variable "project_id" {
  type        = string
  description = "project id"
}

variable "secret" {
  type        = string
  description = "project secret"
  sensitive   = true
}

variable "label" {
  type        = string
  description = "version label"
  default     = "v1.0.0"
}

variable "even_numbers" {
  type        = number
  description = "variable with only even numbers"
  validation {
    condition     = var.even_numbers % 2 == 0
    error_message = "Number is not even number."
  }
}

variable "simple_list" {
  type        = list(string)
  description = "list of strings"
}

variable "name" {
  type = any
}
