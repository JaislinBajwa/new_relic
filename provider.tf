# Configure terraform
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.26.0"
    }
  }
}

# # Configure the New Relic provider
provider "newrelic" {
  account_id = "4043252"
  api_key = "NRAK-XK7DZGE549FJHFKQCHTLPAHO15J"
  region = "US"                    # Valid regions are US and EU
}