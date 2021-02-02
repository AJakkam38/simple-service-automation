data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

}

resource "aws_launch_configuration" "web" {
  name_prefix   = "web-"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"

  security_groups = [ 
    var.http_sg_id,
    var.ssh_sg_id,
    var.redis_sg_id
  ]
  associate_public_ip_address = true

  user_data = <<USER_DATA
#!/bin/bash
sudo yum install git -y
sudo yum install python3 -y
sudo pip3 install virtualenv
git clone https://github.com/AJakkam38/amazon-elasticache-samples.git
cd amazon-elasticache-samples/session-store
virtualenv venv
source ./venv/bin/activate  
pip3 install -r requirements.txt
export REDIS_URL="redis://redis-cluster.gbgisn.0001.use1.cache.amazonaws.com"
export FLASK_APP=example-4.py
export SECRET_KEY=akhila
flask run -h 0.0.0.0 -p 5000 --reload
  USER_DATA

  lifecycle {
    create_before_destroy = true
  }

}