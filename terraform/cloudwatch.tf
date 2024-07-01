resource "aws_cloudwatch_metric_alarm" "http_4xx_alarm" {
  alarm_name          = "HTTP4xxAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ApplicationRequest4xx"
  namespace           = "AWS/ElasticBeanstalk"
  period              = 60
  statistic           = "Average"
  threshold           = 5
  alarm_description   = "More than five 4xx Request Errors in 1 minute."
  actions_enabled     = true

  dimensions = {
    EnvironmentName = aws_elastic_beanstalk_environment.tfenvtest.name
  }

  alarm_actions = [
    aws_sns_topic.alarm_topic.arn,
    aws_lambda_function.slack_notification.arn,
  ]
}