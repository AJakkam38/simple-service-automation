resource "aws_elasticache_subnet_group" "redis-subnet" {
  name       = "redis-subnet"
  subnet_ids = [ var.private_subnet_id ]
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.6"
  port                 = 6379
  subnet_group_name    = "aws_elasticcache_subnet_group.redis-subnet.name"
  automatic_failover_enabled = true
}