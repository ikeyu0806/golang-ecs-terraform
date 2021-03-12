resource "aws_eip" "nat_1a" {
  vpc = true

  tags = {
    Name = "go-web-natgw-1a"
  }
}

resource "aws_eip" "nat_1b" {
  vpc = true

  tags = {
    Name = "go-web-natgw-1b"
  }
}

resource "aws_eip" "nat_1c" {
  vpc = true

  tags = {
    Name = "go-web-natgw-1c"
  }
}

resource "aws_eip" "nat_1d" {
  vpc = true

  tags = {
    Name = "go-web-natgw-1d"
  }
}
