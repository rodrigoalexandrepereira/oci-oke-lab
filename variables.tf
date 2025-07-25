# variables.tf
variable "region_identifier" {
  description = "The OCI region identifier to deploy resources in."
  type        = string
  default     = "GRU"
}

variable "kubernetes_version" {
  description = "Number of version of Kubernetes to use for the OKE cluster."
  type        = string
  default     = "1.33.1"
}

variable "image_id" {
    description = "The OCID of the user calling the provider."
    type        = string
}

variable "tenancy_ocid" {
  description = "The OCID of your OCI Tenancy."
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user calling the provider."
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint of the API key."
  type        = string
  sensitive   = true
}

variable "private_key_path" {
  description = "The path to the private key file."
  type        = string
  sensitive   = true
}

variable "region" {
  description = "The OCI region to deploy resources in."
  type        = string
  default     = "sa-saopaulo-1" # Altere para sua região Always Free, e.g., "us-ashburn-1", "sa-saopaulo-1"
}

variable "compartment_ocid" {
  description = "The OCID of the compartment where resources will be created."
  type        = string
}