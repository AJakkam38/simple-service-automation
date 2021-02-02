resource "aws_elasticache_subnet_group" "redis-subnet" {
  name       = var.subnet_group_name
  subnet_ids = [ 
    var.private_subnet_id_1,
    var.private_subnet_id_2 
  ]
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.6"
  port                 = 6379
  subnet_group_name    = var.subnet_group_name
  security_group_ids = [ var.redis_sg_id ]
}
