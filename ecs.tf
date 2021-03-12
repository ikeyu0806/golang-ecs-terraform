resource "aws_ecs_cluster" "main" {
  name = "go_web"
}

resource "aws_ecs_service" "main" {
  name = "go-web"

  depends_on = [aws_lb_listener_rule.main]

  cluster = aws_ecs_cluster.main.name

  launch_type = "FARGATE"

  desired_count = "1"

  task_definition = aws_ecs_task_definition.main.arn

  network_configuration {
    subnets         = [aws_subnet.private_1a.id, aws_subnet.private_1c.id, aws_subnet.private_1d.id]
    security_groups = [aws_security_group.ecs.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "go_web"
    container_port   = "80"
  }
}

resource "aws_ecs_task_definition" "main" {
  family = "go_web"

  requires_compatibilities = ["FARGATE"]

  cpu    = "256"
  memory = "512"

  network_mode = "awsvpc"

  execution_role_arn    = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = <<EOL
[
  {
    "name": "go_web",
    "image": "public.ecr.aws/e9z3g6v3/go-web:latest",
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
EOL
}
