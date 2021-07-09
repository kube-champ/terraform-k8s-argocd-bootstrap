output "argocd_git_public_key" {
  value = tls_private_key.git.public_key_openssh
}

output "argocd_git_private_key" {
  sensitive = true
  value     = tls_private_key.git.private_key_pem
}

output "sealed_secrets_generated_private_key" {
  sensitive = true
  value     = var.sealed_secrets_key_cert.auto_generate_key_cert ? tls_private_key.sealed_secret_key.0.private_key_pem : ""
}

output "sealed_secrets_generated_cert" {
  sensitive = true
  value     = var.sealed_secrets_key_cert.auto_generate_key_cert ? tls_self_signed_cert.sealed_secret_cert.0.cert_pem : ""
}