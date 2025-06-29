variable "resource_group_name" {
  description = "Name of the Resource Group"
  default     = "rg-email-sender"
}

variable "location" {
  description = "Azure Region"
  default     = "West Europe"
}

variable "storage_account_name" {
  description = "Storage Account Name"
  default     = "emailsenderstoragexyz"
}

variable "service_plan_name" {
  description = "App Service Plan Name"
  default     = "email-sender-plan"
}

variable "function_app_name" {
  description = "Function App Name"
  default     = "email-sender-khushi-func"
}

variable "sendgrid_api_key" {
  description = "SendGrid API Key"
}
