resource "aws_route53_record" "this" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  ttl     = var.ttl
  records = var.records

  dynamic "alias" {
    for_each = var.alias[*]
    content {
      evaluate_target_health = alias.value.evaluate_target_health
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
    }
  }
}
