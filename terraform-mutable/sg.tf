resource "aws_security_group" "sg" {
  name        = "sg_${var.ENV}_${var.COMPONENT}"
  description = "sg_${var.ENV}_${var.COMPONENT}"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID


  ingress {
    description      = "HTTP Traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "sg_${var.ENV}_${var.COMPONENT}"
  }
}

