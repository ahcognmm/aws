resource "aws_vpc" "default"{
    cidr_block="${var.vpc_cidr}"
    enable_dns_hostname=true
    
    tag{
        Name="test-vpc"
    }
}

resource "aws_subnet" "public-subnet"{
    vpc_id="${aws_vpc.default.id}"
    cidr_block="${var.public_subet_cidr}"
    availability_zone="us-east-1a"
    tag{
        Name="public subnet"
    }
}

resource "aws_subnet" "priavte-subnet"{
    vpc_id="${aws_vpc.default.id}"
    cidr_block="${var.private_subet_cidr}"
    availability_zone="us-east-1b"
    tag{
        Name="private subnet"
    }
}
#SG
resource "aws_sercurity_group" "sgweb"{
    name="vpc_test_web"
    description="Allow incoming HTTP& HTTPS connections"
    
    ingress{
        from_port= 80
        to_port= 80
        protocol= "tcp"
        cidr_block=["0.0.0.0/0"]
    }
    ingress{
        from_port= 443
        to_port= 443
        protocol= "tcp"
        cidr_block=["0.0.0.0/0"]
    }

    vpc_id="${aws_vpc.default.id}"
    tag{
        Name="web server sg"
    }

}
resource "aws_sercurity_group" "db"{
	name="vpc_db_sg"
	desciption="allow incomming request"
	ingress{
		from_port=3306
		to_port=3306
		protocol="tcp"
		cidr_block=[0.0.0.0/32]
	}
}
