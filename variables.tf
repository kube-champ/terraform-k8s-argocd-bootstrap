variable "argocd_git_repo_url" {
  description = "The ArgoCD git config"
  type        = string
}

variable "remote_clusters" {
  description = "A list of remote clusters that will be managed by ArgoCD"
  type = list(object({
    name : string
    namespaces : list(string)
    host : string
    caData : string
    token : string
  }))

  default = []
}

variable "namespace" {
  description = "The namespace name that will be created for argo and sealed secret"
  type        = string

  default = "argo-system"
}

variable "namespace_labels" {
  description = "labels to be added to the namespace"
  type        = map(string)

  default = {}
}

variable "argocd_chart_version" {
  description = "The ArgoCD chart version"
  type        = string

  default = "3.7.1"
}

variable "argocd_image_tag" {
  description = "The image tag for the ArgoCD image"
  type        = string

  default = "v2.0.4"
}

variable "argocd_additional_applications" {
  description = "Additional applications to be added to ArgoCD"
  type        = list(any)

  default = []
}

variable "argocd_additional_projects" {
  description = "Additional projeccts to be added to ArgoCD"
  type        = list(any)

  default = []
}

variable "argocd_chart_value_files" {
  description = "A list of values.yaml files to be added to the argo installation."
  type        = list(string)

  default = []
}

variable "argocd_chart_values_overrides" {
  description = "A map of key/value to override the argocdc chart values. The key must be the path/name of the chart value, e.g: `path.to.chart.key`"
  type        = map(string)

  default = {}
}

variable "argocd_git_ssh_key" {
  description = "The keys config for argocd git repo"
  type = object({
    auto_generate_keys : bool,
    private_key : string
  })

  default = {
    auto_generate_keys = true
    private_key        = ""
  }
}

variable "sealed_secrets_key_cert" {
  description = "The key/cert config for sealed secrets. If `auto_generate_key_cert` is false and no custom key/cert is provided, no custom key/cert will be generated"
  type = object({
    auto_generate_key_cert : bool,
    private_key : string
    private_cert : string
  })

  default = {
    auto_generate_key_cert = true
    private_key            = ""
    private_cert           = ""
  }
}

variable "sealed_secrets_chart" {
  description = "The chart version and docker image version."
  type = object({
    repository : string
    chart_version : string
    docker_image_tag : string
  })

  default = {
    repository       = "https://bitnami-labs.github.io/sealed-secrets"
    chart_version    = "1.16.1"
    docker_image_tag = "v0.16.0"
  }
}

variable "sealed_secrets_chart_value_files" {
  description = "A list of values.yaml files to be added to the chart installation."
  type        = list(string)

  default = []
}

variable "sealed_secrets_chart_values_overrides" {
  description = "A map of key/value to override the chart values. The key must be the path/name of the chart value, e.g: `path.to.chart.key`"
  type        = map(string)

  default = {}
}