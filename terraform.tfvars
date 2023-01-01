ports    = [22, 80, 443, 3306, 27017]
image_id = "ami-0cca134ec43cf708f" # TO USE/GET IMAGE ID STATICALY
# ami_name      = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
instance_type    = "t2.micro"
subnet_id        = "subnet-063258f52a6b33c2f"
number_instances = 3
