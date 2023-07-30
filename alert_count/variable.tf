variable "alert_policies" {
  type = list(object({
    account_id                     = string
    type                           = string
    name                           = string
    description                    = string
    runbook_url                    = string
    enabled                        = bool
    violation_time_limit_seconds   = number
    fill_option                    = string
    fill_value                     = number
    aggregation_window             = string
    aggregation_method             = string
    aggregation_delay              = string
    expiration_duration            = string
    open_violation_on_expiration   = bool
    close_violations_on_expiration = bool
    slide_by                       = string
    nrql                           = string
    critical = object({
      operator              = string
      threshold             = number
      threshold_duration    = string
      threshold_occurrences = number
    })
    warning = object({
      operator              = string
      threshold             = number
      threshold_duration    = string
      threshold_occurrences = number
    })
  }))
  default = []
}
