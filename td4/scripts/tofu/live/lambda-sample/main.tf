
data "http" "test_endpoint" { 
url = var.endpoint 
} 
variable "endpoint" {
 description = "The endpoint to test" 
type        = string 
} 
output "status_code" { 
value = data.http.test_endpoint.status_code 
} 
output "response_body" { 
value = data.http.test_endpoint.response_body 
}

terraform {
  required_providers {
    http = {
      source  = "registry.opentofu.org/hashicorp/http"
      version = "~> 3.0"
    }
  }
}

provider "http" {}

output "api_gateway_url" {
  description = "The URL of the API Gateway"
  value       = aws_api_gateway_deployment.api.invoke_url
}

