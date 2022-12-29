//FOR BUCKET
variable "bucket" {
  type = string
}

//FOR PUBLIC ACCESS BLOCK

variable "block_public_acls" {
  type = string
}

variable "block_public_policy" {
  type = string
}

variable "ignore_public_acls" {
  type = string
}

variable "restrict_public_buckets" {
  type = string
}