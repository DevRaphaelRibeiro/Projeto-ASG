# Auto Scaling Group 
 resource "aws_autoscaling_group" "ASG-TEST" {

availability_zones = ["sa-east-1a"]
  desired_capacity   = 0
  max_size           = 0
  min_size           = 0
  
  

  launch_template {
    id      = "lt-092f97b199bd455c0"
    version = "1"
    
  }

  tag {
    key                 = "Value"
    value               = "Pets"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }
}