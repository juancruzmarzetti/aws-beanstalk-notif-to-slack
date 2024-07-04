resource "aws_sns_topic" "alarm_topic" {
  name = "too-much-cpu-error-alarm-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol  = "email"
  endpoint  = var.email
}