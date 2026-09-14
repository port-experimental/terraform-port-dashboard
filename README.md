# terraform-port-dashboard

Creates a Port dashboard page with the `port_page` resource. It deliberately contains no provider configuration or credentials; callers supply both from their root module.

> [!CAUTION]
> **Beta features**
> Dashboard pages require `PORT_BETA_FEATURES_ENABLED=true` in the Terraform pipeline environment. Pin the provider version, validate widget JSON in a non-production Port organization, and review the plan before applying upgrades.

## Requirements

- Terraform >= 1.16
- `port-labs/port-labs` provider >= 2.25.2
- A root module that configures the Port provider with pipeline environment variables `PORT_CLIENT_ID`, `PORT_CLIENT_SECRET`, and `PORT_BETA_FEATURES_ENABLED=true`

## Usage

```hcl
module "dashboard" {
  source = "github.com/<organization>/terraform-port-dashboard?ref=<release-tag>"

  identifier  = "platform-overview"
  title       = "Platform overview"
  description = "Deployment and service health at a glance."
  locked      = true
  icon        = "Dashboard"
  widgets     = [jsonencode(local.dashboard_widget)]
  parent      = null
}
```

`widgets` is a list of JSON-encoded Port widget definitions. Define a widget in the calling root module and pass it as a list, including when the dashboard has only one widget.

## Inputs

- `identifier` — Dashboard’s unique Port identifier. Optional; defaults to `null`.
- `title` — Title displayed in Port. Optional; defaults to `null`.
- `description` — Optional description displayed in Port.
- `locked` — Whether the page is locked. Defaults to `true`.
- `icon` — Optional Port icon.
- `widgets` — Optional list of JSON-encoded dashboard widget definitions.
- `parent` — Optional parent page identifier.

## Outputs

- `identifier` — Dashboard page identifier.
- `parent` — Parent page identifier.
- `created_at` and `created_by` — Creation audit metadata.
- `updated_at` and `updated_by` — Most recent update audit metadata.
