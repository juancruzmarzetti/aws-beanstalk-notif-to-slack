 resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  alarm_name = "EC2InstanceCPUUtilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = 300
  statistic = "Average"
  threshold = 70 

  dimensions = {
    AutoScalingGroupName = aws_elastic_beanstalk_environment.tfenvtest.name
  }

  alarm_description = "Alarm when CPU exceeds 70% over 5 minutes"

  alarm_actions = [
    aws_sns_topic.alarm_topic.arn,
    aws_lambda_function.slack_notification.arn,
  ]
}