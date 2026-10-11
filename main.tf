resource "google_ces_guardrail" "ces_guardrails" {
  for_each = var.ces_guardrails

  app             = each.value.app
  display_name    = each.value.display_name
  guardrail_id    = each.value.guardrail_id
  location        = each.value.location
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  enabled         = each.value.enabled
  project         = each.value.project

  dynamic "action" {
    for_each = each.value.action != null ? [each.value.action] : []
    content {
      dynamic "generative_answer" {
        for_each = action.value.generative_answer != null ? [action.value.generative_answer] : []
        content {
          prompt = generative_answer.value.prompt
        }
      }
      dynamic "respond_immediately" {
        for_each = action.value.respond_immediately != null ? [action.value.respond_immediately] : []
        content {
          dynamic "responses" {
            for_each = respond_immediately.value.responses
            content {
              disabled = responses.value.disabled
              text     = responses.value.text
            }
          }
        }
      }
      dynamic "transfer_agent" {
        for_each = action.value.transfer_agent != null ? [action.value.transfer_agent] : []
        content {
          agent = transfer_agent.value.agent
        }
      }
    }
  }

  dynamic "code_callback" {
    for_each = each.value.code_callback != null ? [each.value.code_callback] : []
    content {
      dynamic "after_agent_callback" {
        for_each = code_callback.value.after_agent_callback != null ? [code_callback.value.after_agent_callback] : []
        content {
          description                 = after_agent_callback.value.description
          disabled                    = after_agent_callback.value.disabled
          proactive_execution_enabled = after_agent_callback.value.proactive_execution_enabled
          python_code                 = after_agent_callback.value.python_code
        }
      }
      dynamic "after_model_callback" {
        for_each = code_callback.value.after_model_callback != null ? [code_callback.value.after_model_callback] : []
        content {
          description                 = after_model_callback.value.description
          disabled                    = after_model_callback.value.disabled
          proactive_execution_enabled = after_model_callback.value.proactive_execution_enabled
          python_code                 = after_model_callback.value.python_code
        }
      }
      dynamic "before_agent_callback" {
        for_each = code_callback.value.before_agent_callback != null ? [code_callback.value.before_agent_callback] : []
        content {
          description                 = before_agent_callback.value.description
          disabled                    = before_agent_callback.value.disabled
          proactive_execution_enabled = before_agent_callback.value.proactive_execution_enabled
          python_code                 = before_agent_callback.value.python_code
        }
      }
      dynamic "before_model_callback" {
        for_each = code_callback.value.before_model_callback != null ? [code_callback.value.before_model_callback] : []
        content {
          description                 = before_model_callback.value.description
          disabled                    = before_model_callback.value.disabled
          proactive_execution_enabled = before_model_callback.value.proactive_execution_enabled
          python_code                 = before_model_callback.value.python_code
        }
      }
    }
  }

  dynamic "content_filter" {
    for_each = each.value.content_filter != null ? [each.value.content_filter] : []
    content {
      banned_contents                   = content_filter.value.banned_contents
      banned_contents_in_agent_response = content_filter.value.banned_contents_in_agent_response
      banned_contents_in_user_input     = content_filter.value.banned_contents_in_user_input
      disregard_diacritics              = content_filter.value.disregard_diacritics
      match_type                        = content_filter.value.match_type
    }
  }

  dynamic "llm_policy" {
    for_each = each.value.llm_policy != null ? [each.value.llm_policy] : []
    content {
      allow_short_utterance     = llm_policy.value.allow_short_utterance
      fail_open                 = llm_policy.value.fail_open
      max_conversation_messages = llm_policy.value.max_conversation_messages
      dynamic "model_settings" {
        for_each = llm_policy.value.model_settings != null ? [llm_policy.value.model_settings] : []
        content {
          model       = model_settings.value.model
          temperature = model_settings.value.temperature
        }
      }
      policy_scope = llm_policy.value.policy_scope
      prompt       = llm_policy.value.prompt
    }
  }

  dynamic "llm_prompt_security" {
    for_each = each.value.llm_prompt_security != null ? [each.value.llm_prompt_security] : []
    content {
      dynamic "custom_policy" {
        for_each = llm_prompt_security.value.custom_policy != null ? [llm_prompt_security.value.custom_policy] : []
        content {
          allow_short_utterance     = custom_policy.value.allow_short_utterance
          fail_open                 = custom_policy.value.fail_open
          max_conversation_messages = custom_policy.value.max_conversation_messages
          dynamic "model_settings" {
            for_each = custom_policy.value.model_settings != null ? [custom_policy.value.model_settings] : []
            content {
              model       = model_settings.value.model
              temperature = model_settings.value.temperature
            }
          }
          policy_scope = custom_policy.value.policy_scope
          prompt       = custom_policy.value.prompt
        }
      }
      dynamic "default_settings" {
        for_each = llm_prompt_security.value.default_settings != null ? [llm_prompt_security.value.default_settings] : []
        content {
        }
      }
      fail_open = llm_prompt_security.value.fail_open
    }
  }

  dynamic "model_safety" {
    for_each = each.value.model_safety != null ? [each.value.model_safety] : []
    content {
      dynamic "safety_settings" {
        for_each = model_safety.value.safety_settings
        content {
          category  = safety_settings.value.category
          threshold = safety_settings.value.threshold
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

