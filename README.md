# terraform-port-dashboard

Creates a Port dashboard page with the `port_page` resource. It contains no provider configuration or credentials; the calling root module supplies both.

> [!CAUTION]
> **Beta features**
> Dashboard pages require `PORT_BETA_FEATURES_ENABLED=true` in the Terraform pipeline environment. Pin the provider version, validate widget JSON in a non-production Port organization, and review the plan before applying upgrades.

## Resources Created

- `port_page` (type `dashboard`)

## Prerequisites

```
Terraform >= 1.0.0
Port Provider (port-labs/port-labs) >= 2.22.0
```

The calling root module configures the Port provider from `PORT_CLIENT_ID`, `PORT_CLIENT_SECRET` and `PORT_BETA_FEATURES_ENABLED=true`.

## Installing

```hcl
module "dashboard" {
  source = "github.com/port-experimental/terraform-port-dashboard?ref=1.0.1"

  identifier = "platform-overview"
  title      = "Platform overview"
  widgets    = [jsonencode(local.dashboard_widget)]
}
```

## Usage

```hcl
module "dashboard" {
  source = "github.com/port-experimental/terraform-port-dashboard?ref=1.0.1"

  identifier  = "platform-overview"
  title       = "Platform overview"
  description = "Deployment and service health at a glance."
  locked      = true
  icon        = "Dashboard"
  widgets     = [jsonencode(local.dashboard_widget)]
  parent      = "platform_folder"
}
```

`widgets` is a list of JSON-encoded Port widget definitions (the Pages API widget envelope). Define a widget in the calling root module and pass it as a list, including when the dashboard has only one widget.

## Inputs

| Name | Description | Type | Default | Required |
|---|---|---|---|---|
| `identifier` | Unique identifier of the dashboard page. Required: Port rejects a page without one. | `string` | n/a | yes |
| `title` | The title of the dashboard | `string` | `null` | no |
| `description` | The description of the dashboard | `string` | `null` | no |
| `locked` | The locked status of the dashboard | `bool` | `true` | no |
| `icon` | The icon of the dashboard | `string` | `null` | no |
| `widgets` | The widgets of the dashboard | `list(string)` | `null` | no |
| `parent` | The parent page of the dashboard | `string` | `null` | no |

## Outputs

| Name | Description |
|---|---|
| `identifier` | Identifier of the dashboard page |
| `parent` | Identifier of the parent page or sidebar folder, if any |
| `created_at` | When the page was created |
| `created_by` | Who created the page |
| `updated_at` | When the page was last updated |
| `updated_by` | Who last updated the page |

## Standards notes

Deliberate departures from the Terraform module standard, so reviewers don't re-raise them:

- **No `data.tf`.** The module has no data sources or locals, and the standard does not allow empty files.
- **No naming or tag variables** (`project`, `client`, `env`, `name`, `managedby`, `region`, `category`, `component_type`, `common_tags`, `extra_tags`). Port pages are not AWS resources and carry no tags; the page `identifier` is the name.
