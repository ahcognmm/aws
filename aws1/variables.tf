variable "aws_region"{
    description="Region for VPC"
    default="us-east-1"
}

variable "vpc_cidr"{
    description="CIDR for the VPC"
    default="10.0.0.0/16"
}

variable "public_subnet_cidr"{
    description="CIDR for public"
    default="10.0.1.0/24"
}

variable "private_subnet_cidr"{
    description="CIDR for private"
    default="10.0.2.0/24"
}

variable "ami"{
    description="Amazon Linux AMI"
    default="ami-ffc834"
}

variable "key-path"{
    description="ssh"
    default=""
}
