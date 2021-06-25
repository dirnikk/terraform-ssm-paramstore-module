resource "aws_ssm_parameter" "bla" {
  for_each = { for x in var.ssm_params : x.name => x }

  name      = each.value.name
  type      = "SecureString"
  value     = each.value.value
  overwrite = true
}

variable "ssm_params" {
  type = map(object({
    name  = string
    value = string
  }))
  default = {
    name : {
      name  = "pesho"
      value = "blaa2"
    },
    blaa : {
      name  = "gosho"
      value = "blaa1"
    }
  }
}


//When you call the module use TF-VAR example
//ssm_params = {
//  "param1" : {
//    "name" : "param1",
//    "value" : <<EOT
//valueA=1
//valueB=2
//valueC=3
//   EOT
//  },
//  "param2" : {
//    "name" : "param2",
//    "value" : <<EOT
//valueA=1
//valueB=2
//valueC=3
//   EOT
//  }
//}
