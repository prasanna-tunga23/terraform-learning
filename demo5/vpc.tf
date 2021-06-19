resource "aws_vpc" "pras" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy="default"
  enable_dns_support="true"
  enable_dns_hostnames="true"
  enable_classiclink="false"
  tags={
    Name="pras"
  }
}

#subnets
resource "aws_subnet" "pras-public-1"{
  vpc_id=aws_vpc.pras.id
  cidr_block="10.0.1.0/24"
  map_public_ip_on_launch="true"
  availability_zone="eu-west-1a"
  
  tags={
    Name="pras-public-1"
  }
}
resource "aws_subnet" "pras-private-1"{
  vpc_id=aws_vpc.pras.id
  cidr_block="10.0.4.0/24"
  map_public_ip_on_launch="false"
  availability_zone="eu-west-1a"
  
  tags={
    Name="pras-private-1"
  }
}

#Internet Gateway

resource "aws_internet_gateway" "pras-gw"{
  vpc_id=aws_vpc.pras.id
  
  tags={
    Name="pras"
  }
}

#routetables

resource "aws_route_table" "pras-public"{
  vpc_id=aws_vpc.pras.id
  route{
    cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway.pras-gw.id
  }
  tags={
    Name="pras-public-1"
  }
}

#route associations public

resource "aws_route_table_association" "pras-public-1-a"{
  subnet_id=aws_subnet.pras-public-1.id
  route_table_id=aws_route_table.pras-public.id
}

  
