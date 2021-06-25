module "ssm-parameters" {
  source     = "../"
  ssm_params = var.ssm_params
}
variable "ssm_params" {}
