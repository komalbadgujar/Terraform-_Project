resource "aws_launch_template" "web_template" {
    name_prefix = "web-template"
    image_id = "ami-051a31ab2f4d498f5"
    instance_type = var.instance_type

    user_data = <<EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd
    echo "<h1> hello from $(hostname)" > /var/www/html/index.html
    EOF

    
   network_interfaces {
        associate_public_ip_address =true
        security_groups = [aws_security_group.web_sg.id]

    }
  
}

#Autoscaling

resource "aws_autoscaling_group" "web-asg" {
    desired_capacity = 2
    max_size = 3
    min_size = 2

    vpc_zone_identifier = [
        aws_subnet.public1.id,
        aws_subnet.public2.id
    ]
  
  launch_template {
    id =aws_launch_template.web_template.id
    version ="$latest"
  }
}