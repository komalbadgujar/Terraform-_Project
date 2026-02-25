resource "aws_lb" "alb" {
    name = "ha-alb"
    load_balancer_type = "application"
    security_groups = [aws_security_group.web_sg.id]
    subnets = [
        aws_subnet.public1.id,
        aws_subnet.public2.id
    ]
}