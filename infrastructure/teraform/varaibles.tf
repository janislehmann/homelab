variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
  sensitive = true
}

variable "pm_api_token_secret" {
  type = string
  sensitive = true
}

variable "local_user_name" {
    type = string
}

variable "local_user_pass" {
    type = string
    sensitive = true
}

variable "ssh_public_key" {
    type = string
    sensitive = true
}

