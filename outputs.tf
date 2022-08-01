output "id" {
  value = module.emr.id
}

output "name" {
  value = module.emr.name
}

output "master_public_dns" {
  value = module.emr.master_public_dns
}

output "rand_string" {
  value = random_string.rand.result
}