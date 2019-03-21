resource "aws_key_pair" "default"{
    key_name= "vpctestkeypair"
    public_key=""
}

resource "aws_instance" "web-api"{
    ami= "${var.ami}"
    instance_type="t2.mirco"
    key_name="${aws_key_pair.de}"
}
