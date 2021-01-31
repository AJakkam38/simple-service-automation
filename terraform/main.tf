module "my_vpc" {
  source = "./modules/networking"
  vpc_id = module.my_vpc.vpc_id
  igw_id = module.my_vpc.igw_id
  public_subnet_id = module.my_vpc.public_subnet_id
  private_subnet_id = module.my_vpc.private_subnet_id
  public_route_table_id = module.my_vpc.public_route_table_id
  private_route_table_id = module.my_vpc.private_route_table_id
  ssh_sg_id = module.my_vpc.ssh_sg_id
}
