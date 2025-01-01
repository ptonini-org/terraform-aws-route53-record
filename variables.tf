variable "name" {}

variable "zone_id" {}

variable "type" {
  default = "A"
  nullable = false
}

variable "records" {
  type    = set(string)
  default = []
  nullable = false
}

variable "ttl" {
  default = 300
  nullable = false
}

variable "alias" {
  type = object({
    evaluate_target_health = optional(bool, false)
    name                   = string
    zone_id                = string
  })
  default = null
}
