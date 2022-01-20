provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
  preemptible     = var.preemptible

}
module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
  preemptible     = var.preemptible
}

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

