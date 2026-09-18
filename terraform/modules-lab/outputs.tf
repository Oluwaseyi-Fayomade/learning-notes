output "all_hello_paths" {
  value = { for k, m in module.hello : k => m.file_path }
}

output "region_east" {
  value = module.region_east.region
}

output "region_west" {
  value = module.region_west.region
}

output "hello_from_registry_path" {
  value = module.hello_from_registry.file_path
}
