resource "newrelic_alert_policy" "my_policy" {
  count = length(var.alert_policies)

  name = var.alert_policies[count.index].name
}

resource "newrelic_nrql_alert_condition" "foo" {
  count = length(var.alert_policies)

  account_id                     = var.alert_policies[count.index].account_id
  policy_id                      = newrelic_alert_policy.my_policy[count.index].id
  type                           = var.alert_policies[count.index].type
  name                           = var.alert_policies[count.index].name
  description                    = var.alert_policies[count.index].description
  runbook_url                    = var.alert_policies[count.index].runbook_url
  enabled                        = var.alert_policies[count.index].enabled
  violation_time_limit_seconds   = var.alert_policies[count.index].violation_time_limit_seconds
  fill_option                    = var.alert_policies[count.index].fill_option
  fill_value                     = var.alert_policies[count.index].fill_value
  aggregation_window             = var.alert_policies[count.index].aggregation_window
  aggregation_method             = var.alert_policies[count.index].aggregation_method
  aggregation_delay              = var.alert_policies[count.index].aggregation_delay
  expiration_duration            = var.alert_policies[count.index].expiration_duration
  open_violation_on_expiration   = var.alert_policies[count.index].open_violation_on_expiration
  close_violations_on_expiration = var.alert_policies[count.index].close_violations_on_expiration
  slide_by                       = var.alert_policies[count.index].slide_by

  nrql {
    query = var.alert_policies[count.index].nrql
  }

  critical {
    operator              = var.alert_policies[count.index].critical.operator
    threshold             = var.alert_policies[count.index].critical.threshold
    threshold_duration    = var.alert_policies[count.index].critical.threshold_duration
    threshold_occurrences = var.alert_policies[count.index].critical.threshold_occurrences
  }

  warning {
    operator              = var.alert_policies[count.index].warning.operator
    threshold             = var.alert_policies[count.index].warning.threshold
    threshold_duration    = var.alert_policies[count.index].warning.threshold_duration
    threshold_occurrences = var.alert_policies[count.index].warning.threshold_occurrences
  }
}
