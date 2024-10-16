terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.129.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = "/home/sergei/yandex-cloud/authorized_key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  zone      = var.zone
}
