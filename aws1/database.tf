resource "aws_db_instance" "master"{
	identifier="master"
	instance_class="db.m1.large"
	allcated_storage = 20
	engine = "mysql"
	name = "master"
	username="${var.db_password}"
	password="${var.db_user}"
	engine_version="5.7.00"
	skip_final_snapshot= true
	db_subnet_group_name="${aws_db_subnet_group.dbsubnet.name}"
	vpc_security_group_ids=["${aws_sercurity_group.db.id}"]
}
