resource "aws_cloudwatch_log_metric_filter" "filter" {
  name            = "${var.activity_alarm_name}-filter"

  log_group_name  = var.log_group_name
  pattern         = var.log_filter

  metric_transformation {
    name      = var.activity_alarm_name
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name          = "${var.activity_alarm_name}-alarm"
  alarm_description   = var.alarm_text
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.filter.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.filter.metric_transformation[0].namespace
  period              = var.alarm_period_seconds
  threshold           = "1"
  statistic           = "Sum"
  alarm_actions       = [var.alarm_action]
  treat_missing_data  = "breaching"
  tags                = var.alarm_tags 
}
