output "identifier" {
  description = "Identifier of the dashboard page"
  value       = port_page.main.identifier
}

output "parent" {
  description = "Identifier of the parent page or sidebar folder, if any"
  value       = port_page.main.parent
}

output "created_at" {
  description = "When the page was created"
  value       = port_page.main.created_at
}

output "created_by" {
  description = "Who created the page"
  value       = port_page.main.created_by
}

output "updated_at" {
  description = "When the page was last updated"
  value       = port_page.main.updated_at
}

output "updated_by" {
  description = "Who last updated the page"
  value       = port_page.main.updated_by
}
