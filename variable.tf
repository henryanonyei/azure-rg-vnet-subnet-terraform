variable "Project_Name" {
  description = "Short name used as a prefix for all resource names"
  type        = string
  default     = "monitoring"
}

variable "Environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region to deploy resources into"
  type        = string
  default     = "eastus"
}