resource "port_page" "main" {
  type        = "dashboard"
  identifier  = var.identifier
  title       = var.title
  description = var.description
  locked      = var.locked
  icon        = var.icon
  widgets     = var.widgets
  parent      = var.parent
}