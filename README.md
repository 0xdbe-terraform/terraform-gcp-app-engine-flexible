# terraform-gcp-app-engine-flexible

Terraform module to create an Google App Engine for flexible environment.

## Usage

```
module "gcp_project" {
  source             = "git::https://github.com/0xdbe-terraform/terraform-gcp-project.git?ref=v1.1.1"
  organization_id    = local.organization_id
  billing_account_id = local.billing_account_id
  project_short_name = local.project_short_name
  project_long_name  = local.project_long_name
}

module "gcp_app_engine_flexible" {
  source               = "git::https://github.com/0xdbe-terraform/terraform-gcp-app-engine-flexible.git?ref=v1.0.0"
  location_id          = var.location_id
  project_id           = module.gcp_project.project_id
  project_number       = module.gcp_project.project_number
}
```