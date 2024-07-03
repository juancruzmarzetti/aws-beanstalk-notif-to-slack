resource "aws_cloudwatch_metric_alarm" "eb_environment_health_alarm" {
  alarm_name          = "EBEnvironmentHealthAlarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Health"
  namespace           = "AWS/ElasticBeanstalk"
  period              = 300
  statistic           = "Average"
  threshold           = 1
  alarm_description   = "Alarm when environment health is not Ok"
  actions_enabled     = true

  dimensions = {
    EnvironmentName = aws_elastic_beanstalk_environment.tfenvtest.name
  }

  alarm_actions = [
    aws_sns_topic.alarm_topic.arn,
    aws_lambda_function.slack_notification.arn,
  ]
}