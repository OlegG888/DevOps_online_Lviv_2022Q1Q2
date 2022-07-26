output "ci_cd_dns" {
  value = "${aws_instance.ci_cd.public_dns}:${var.port}"
}
