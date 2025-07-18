output "public_ip" {
  description = "Adresse IP publique de la VM"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "blob_url" {
  description = "URL principale du compte de stockage (point d’entrée Blob)"
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}

output "container_url" {
  description = "URL complète du container de fichiers statiques"
  value       = azurerm_storage_container.static.id
}

output "vm_name" {
  description = "Nom de la machine virtuelle créée"
  value       = azurerm_linux_virtual_machine.vm.name
}