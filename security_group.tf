resource "aws_security_group" "ecs" {
  name        = "go-web-ecs"
  description = "go-web ecs"

  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "go-web-ecs"
  }
}

resource "aws_security_group_rule" "ecs" {
  security_group_id = aws_security_group.ecs.id

  type = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"

  cidr_blocks = ["10.0.0.0/16"]
}

resource "aws_security_group" "alb" {
  name        = "go-web-alb"
  description = "go-web alb"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "go-web-alb"
  }
}

resource "aws_security_group_rule" "alb_http" {
  security_group_id = aws_security_group.alb.id

  type = "ingress"

  from_port = 80
  to_port   = 80
  protocol  = "tcp"

  cidr_blocks = ["0.0.0.0/0"]
}
