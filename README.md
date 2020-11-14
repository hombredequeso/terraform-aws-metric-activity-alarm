# Basic Activity Alarm in AWS Using Terraform

This terraform module sets up aws resources to alarm when no logging is received. It is intended to used as a non-activity alarm - in other words, if something does not appear to be working (as identified by the presence of some particular logging within a period of time) then an alarm will be switched on.


## Usage
For example:
```
module "my_alarm" {
  source = "./../../terraform-aws-metric-activity-alarm"

  activity_alarm_name    = "test-event-occurred"
  alarm_tags = {}

  log_group_name = aws_cloudwatch_log_group.some_log_group.name
  log_filter = "\"event succeeded\""

  alarm_text = "test event has not occured within the last 5 minutes"
  alarm_period_seconds = "300"
  alarm_action = "arn:aws:sns:ap-southeast-2:12345678:my-email-alarms"

  metric_namespace = "projectname/subproject/areaOfConcern"
}
```
