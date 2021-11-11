variable "access_token" {
  description = "Twitter API Access Token."
  sensitive   = true
  type        = string
}

variable "access_token_secret" {
  description = "Twitter API Access Token Secret."
  sensitive   = true
  type        = string
}

variable "consumer_api_key" {
  description = "Twitter API Consumer Key."
  sensitive   = true
  type        = string
}

variable "consumer_api_secret" {
  description = "Twitter API Consumer Secret."
  sensitive   = true
  type        = string
}
