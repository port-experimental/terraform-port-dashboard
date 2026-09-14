variable "identifier" {
  type        = string
  description = "The identifier of the dashboard"
  default     = null
}

variable "title" {
  type        = string
  description = "The  of the dashboard"
  default     = null
}

variable "description" {
  type        = string
  description = "The description of the dashboard"
  default     = null
}

variable "locked" {
  type        = bool
  description = "The locked status of the dashboard"
  default     = true
}

variable "icon" {
  type        = string
  description = "The icon of the dashboard"
  default     = null
}

variable "widgets" {
  type        = list(string)
  description = "The widgets of the dashboard"
  default     = null
}

variable "parent" {
  type        = string
  description = "The parent page of the dashboard"
  default     = null
}