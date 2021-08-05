output "argocd_git_public_key" {
  value = module.argocd-bootstrap.git_public_key
}

output "argocd_password" {
  sensitive = true
  value     = module.argocd-bootstrap.admin_password
}