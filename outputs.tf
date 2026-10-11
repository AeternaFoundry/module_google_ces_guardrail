output "ces_guardrails_id" {
  description = "Map of id values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no id are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ces_guardrails_action" {
  description = "Map of action values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no action are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => one(v.action) if v.action != null && length(v.action) > 0 }
}
output "ces_guardrails_app" {
  description = "Map of app values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no app are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.app if v.app != null && length(v.app) > 0 }
}
output "ces_guardrails_code_callback" {
  description = "Map of code_callback values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no code_callback are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => one(v.code_callback) if v.code_callback != null && length(v.code_callback) > 0 }
}
output "ces_guardrails_content_filter" {
  description = "Map of content_filter values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no content_filter are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => one(v.content_filter) if v.content_filter != null && length(v.content_filter) > 0 }
}
output "ces_guardrails_create_time" {
  description = "Map of create_time values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no create_time are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "ces_guardrails_deletion_policy" {
  description = "Map of deletion_policy values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no deletion_policy are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "ces_guardrails_description" {
  description = "Map of description values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no description are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.description if v.description != null && length(v.description) > 0 }
}
output "ces_guardrails_display_name" {
  description = "Map of display_name values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no display_name are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "ces_guardrails_enabled" {
  description = "Map of enabled values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no enabled are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.enabled if v.enabled != null }
}
output "ces_guardrails_etag" {
  description = "Map of etag values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no etag are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "ces_guardrails_guardrail_id" {
  description = "Map of guardrail_id values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no guardrail_id are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.guardrail_id if v.guardrail_id != null && length(v.guardrail_id) > 0 }
}
output "ces_guardrails_llm_policy" {
  description = "Map of llm_policy values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no llm_policy are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => one(v.llm_policy) if v.llm_policy != null && length(v.llm_policy) > 0 }
}
output "ces_guardrails_llm_prompt_security" {
  description = "Map of llm_prompt_security values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no llm_prompt_security are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => one(v.llm_prompt_security) if v.llm_prompt_security != null && length(v.llm_prompt_security) > 0 }
}
output "ces_guardrails_location" {
  description = "Map of location values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no location are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.location if v.location != null && length(v.location) > 0 }
}
output "ces_guardrails_model_safety" {
  description = "Map of model_safety values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no model_safety are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => one(v.model_safety) if v.model_safety != null && length(v.model_safety) > 0 }
}
output "ces_guardrails_name" {
  description = "Map of name values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no name are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.name if v.name != null && length(v.name) > 0 }
}
output "ces_guardrails_project" {
  description = "Map of project values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no project are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.project if v.project != null && length(v.project) > 0 }
}
output "ces_guardrails_update_time" {
  description = "Map of update_time values across all ces_guardrails, keyed the same as var.ces_guardrails except keys with no update_time are omitted"
  value       = { for k, v in google_ces_guardrail.ces_guardrails : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

