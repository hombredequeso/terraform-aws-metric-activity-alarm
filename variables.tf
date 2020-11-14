variable "activity_alarm_name" {
  description = "Name of the metric, base name of filter and alarm"
}

variable "alarm_tags" {
  description = "Tags to add to resources"
  type = map(string)
}

variable "log_group_name" {
  description = "Name of the log group"
}

variable "log_filter" {
  description = "What to look for in log_group_name"
}

variable "alarm_text" {
  description = "Text reported when alarm goes"
}

variable "alarm_period_seconds" {
  description = "Number of seconds, in which, if there are no events the alarm will sound"
}

variable "alarm_action" {
  description = "What to do when the alarm sounds. e.g. sns "
}

variable "metric_namespace" {
  description = "namespace the metric will appear under. Metric is called activity_alarm_name"
}
