variable "namespace_name" {
  type        = string
  default     = "production"
  description = "Namespace to be Provisioned"
}

variable "pod_name" {
  type        = string
  default     = "login-pod"
  description = "POD Name for the Application to be Deployed"
}

variable "image_name" {
  type        = string
  default     = "devopscloudautomation/web-application:1"
  description = "Image Name for the POD Deployment"
}

variable "container_port" {
  type        = number
  default     = 8080
  description = "Container Port for the POD Deployment"
}

variable "service_name" {
  type        = string
  default     = "login-service"
  description = "Service Name for the POD Deployment"
}