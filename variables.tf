variable "ces_guardrails" {
  description = <<EOT
Map of ces_guardrails, attributes below
Required:
    - app
    - display_name
    - guardrail_id
    - location
Optional:
    - deletion_policy
    - description
    - enabled
    - project
    - action (block):
        - generative_answer (optional, block):
            - prompt (required)
        - respond_immediately (optional, block):
            - responses (required, block):
                - disabled (optional)
                - text (required)
        - transfer_agent (optional, block):
            - agent (required)
    - code_callback (block):
        - after_agent_callback (optional, block):
            - description (optional)
            - disabled (optional)
            - proactive_execution_enabled (optional)
            - python_code (required)
        - after_model_callback (optional, block):
            - description (optional)
            - disabled (optional)
            - proactive_execution_enabled (optional)
            - python_code (required)
        - before_agent_callback (optional, block):
            - description (optional)
            - disabled (optional)
            - proactive_execution_enabled (optional)
            - python_code (required)
        - before_model_callback (optional, block):
            - description (optional)
            - disabled (optional)
            - proactive_execution_enabled (optional)
            - python_code (required)
    - content_filter (block):
        - banned_contents (optional)
        - banned_contents_in_agent_response (optional)
        - banned_contents_in_user_input (optional)
        - disregard_diacritics (optional)
        - match_type (required)
    - llm_policy (block):
        - allow_short_utterance (optional)
        - fail_open (optional)
        - max_conversation_messages (optional)
        - model_settings (optional, block):
            - model (optional)
            - temperature (optional)
        - policy_scope (required)
        - prompt (required)
    - llm_prompt_security (block):
        - custom_policy (optional, block):
            - allow_short_utterance (optional)
            - fail_open (optional)
            - max_conversation_messages (optional)
            - model_settings (optional, block):
                - model (optional)
                - temperature (optional)
            - policy_scope (required)
            - prompt (required)
        - default_settings (optional, block):
        - fail_open (optional)
    - model_safety (block):
        - safety_settings (required, block):
            - category (required)
            - threshold (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    app             = string
    display_name    = string
    guardrail_id    = string
    location        = string
    deletion_policy = optional(string)
    description     = optional(string)
    enabled         = optional(bool)
    project         = optional(string)
    action = optional(object({
      generative_answer = optional(object({
        prompt = string
      }))
      respond_immediately = optional(object({
        responses = list(object({
          disabled = optional(bool)
          text     = string
        }))
      }))
      transfer_agent = optional(object({
        agent = string
      }))
    }))
    code_callback = optional(object({
      after_agent_callback = optional(object({
        description                 = optional(string)
        disabled                    = optional(bool)
        proactive_execution_enabled = optional(bool)
        python_code                 = string
      }))
      after_model_callback = optional(object({
        description                 = optional(string)
        disabled                    = optional(bool)
        proactive_execution_enabled = optional(bool)
        python_code                 = string
      }))
      before_agent_callback = optional(object({
        description                 = optional(string)
        disabled                    = optional(bool)
        proactive_execution_enabled = optional(bool)
        python_code                 = string
      }))
      before_model_callback = optional(object({
        description                 = optional(string)
        disabled                    = optional(bool)
        proactive_execution_enabled = optional(bool)
        python_code                 = string
      }))
    }))
    content_filter = optional(object({
      banned_contents                   = optional(list(string))
      banned_contents_in_agent_response = optional(list(string))
      banned_contents_in_user_input     = optional(list(string))
      disregard_diacritics              = optional(bool)
      match_type                        = string
    }))
    llm_policy = optional(object({
      allow_short_utterance     = optional(bool)
      fail_open                 = optional(bool)
      max_conversation_messages = optional(number)
      model_settings = optional(object({
        model       = optional(string)
        temperature = optional(number)
      }))
      policy_scope = string
      prompt       = string
    }))
    llm_prompt_security = optional(object({
      custom_policy = optional(object({
        allow_short_utterance     = optional(bool)
        fail_open                 = optional(bool)
        max_conversation_messages = optional(number)
        model_settings = optional(object({
          model       = optional(string)
          temperature = optional(number)
        }))
        policy_scope = string
        prompt       = string
      }))
      default_settings = optional(object({
      }))
      fail_open = optional(bool)
    }))
    model_safety = optional(object({
      safety_settings = list(object({
        category  = string
        threshold = string
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.ces_guardrails : (
        v.action == null || (v.action.respond_immediately == null || (length(v.action.respond_immediately.responses) >= 1))
      )
    ])
    error_message = "Each responses list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.ces_guardrails : (
        v.model_safety == null || (length(v.model_safety.safety_settings) >= 1)
      )
    ])
    error_message = "Each safety_settings list must contain at least 1 items"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

