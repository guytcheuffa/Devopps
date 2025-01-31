run "deploy" {
  command = apply
}

run "validate" {
  command = apply

  module {
    source = "../../modules/test-endpoint"
  }

  variables {
    endpoint = run.deploy.api_endpoint
  }

  assert {
    condition     = data.http.test_endpoint.status_code == 201
    error_message = "Unexpected status code: ${data.http.test_endpoint.status_code}"
  }

  assert {
    condition     = jsondecode(data.http.test_endpoint.response_body)["message"] == "Lambda function executed successfully!"
    error_message = "Unexpected response body: ${data.http.test_endpoint.response_body}"
  }
}
