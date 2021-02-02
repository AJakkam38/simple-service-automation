module "my_vpc" {
  source = "./modules/networking"
  vpc_id = module.my_vpc.vpc_id
  igw_id = module.my_vpc.igw_id
  public_subnet_id_1 = module.my_vpc.public_subnet_id_1
  public_subnet_id_2 = module.my_vpc.public_subnet_id_2
  private_subnet_id_1 = module.my_vpc.private_subnet_id_1
  private_subnet_id_2 = module.my_vpc.private_subnet_id_2
  public_route_table_id = module.my_vpc.public_route_table_id
  private_route_table_id = module.my_vpc.private_route_table_id
  http_sg_id = module.my_vpc.http_sg_id
  redis_sg_id = module.my_vpc.redis_sg_id
  ssh_sg_id = module.my_vpc.ssh_sg_id
}

module "my_frontend" {
  source = "./modules/compute"
  vpc_id = module.my_vpc.vpc_id
  alb_dns_name = module.my_frontend.alb_dns_name
  public_subnet_id_1 = module.my_vpc.public_subnet_id_1
  public_subnet_id_2 = module.my_vpc.public_subnet_id_2
  http_sg_id = module.my_vpc.http_sg_id
  redis_sg_id = module.my_vpc.redis_sg_id
  ssh_sg_id = module.my_vpc.ssh_sg_id
}

module "my_backend" {
  source = "./modules/database"
  private_subnet_id_1 = module.my_vpc.private_subnet_id_1
  private_subnet_id_2 = module.my_vpc.private_subnet_id_2
  redis_sg_id = module.my_vpc.redis_sg_id
}