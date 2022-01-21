resource "local_file" "generate_inventory" {
  content = templatefile("../../ansible/environments/prod/inventory.tftpl", {
    ip_app = module.app.external_ip_address_app,
    ip_db = module.db.external_ip_address_db
  })
  filename = "../../ansible/environments/prod/inventory.yml"

  provisioner "local-exec" {
    command = "chmod a-x ../../ansible/environments/prod/inventory.yml"
  }

  provisioner "local-exec" {
    when       = destroy
    command    = "mv ../../ansible/environments/prod/inventory.yml ../../ansible/environments/prod/inventory.yml.backup"
    on_failure = continue
  }
}

#db ip ansible config
resource "local_file" "generate_app_db_config_in_variable" {
  content = templatefile("../../ansible/environments/prod/group_vars/app.tftpl", {
    db_host = module.db.internal_ip_address_db
  })
  filename = "../../ansible/environments/prod/group_vars/app"

    provisioner "local-exec" {
    when       = destroy
    command    = "mv ../../ansible/environments/prod/group_vars/app ../../ansible/environments/prod/group_vars/app.backup"
    on_failure = continue
  }

}
