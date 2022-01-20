resource "local_file" "generate_inventory" {
  content = templatefile("../../ansible/inventory.tftpl", {
    ip_app = module.app.external_ip_address_app,
    ip_db = module.db.external_ip_address_db
  })
  filename = "../../ansible/inventory.yml"

  provisioner "local-exec" {
    command = "chmod a-x ../../ansible/inventory.yml"
  }

  provisioner "local-exec" {
    when       = destroy
    command    = "mv ../../ansible/inventory.yml ../../ansible/inventory.yml.backup"
    on_failure = continue
  }
}
