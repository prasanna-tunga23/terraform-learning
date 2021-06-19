resource "aws_instance" "example"{
  ami = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  
  subnet_id = aws_subnet.pras-public-1.id
  
  vpc_security_group_ids = [aws_security_group.pras-allow-ssh.id]
  
  key_name = aws_key_pair.mykeypair.key_name
}
