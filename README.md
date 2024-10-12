# Дипломный практикум в Yandex.Cloud


## 1. Создание облачной инфраструктуры в ЯО при помощи Terraform
   
###  1.1. Создаем сервисный аккаунт:

![1](https://github.com/RziankinS/devops-netology/blob/ff04a0ef967b58e93cde09b53f2afb187c66aa79/screen/project/%D1%81%D0%B5%D1%80%D0%B2%D0%B8%D1%81%D0%BD%D1%8B%D0%B9%20%D0%B0%D0%BA%D0%BA%D0%B0%D1%83%D0%BD%D1%82.png)

---

###  1.2. Подготавливаем backend для Terraform, вариант S3 bucket:
      
![2](https://github.com/RziankinS/devops-netology/blob/935d01b42eac2857a5db1a4e5f0cd34902ba4112/screen/project/tfstate.png)

---

###  1.3. Создаем VPC с подсетями в разных зонах доступности:
      
![3](https://github.com/RziankinS/devops-netology/blob/ca6d747d9463e0a73f462f7f459f52df051706ad/screen/project/vpc.png)

---

###  1.4.1. Проводим проверку, выполнения команды "terraform apply -auto-approve" для создания сервисного аккаунта и бакета

<details>
<summary>terraform apply --auto-approve</summary>
   
```bash
sergei@XWHD911:~/yandex-cloud/terraform/bucket$ terraform apply --auto-approve
yandex_iam_service_account.sa-dev: Refreshing state... [id=ajec7uhkm7ep6ltnnls9]
yandex_resourcemanager_folder_iam_member.terraform-editor: Refreshing state... [id=b1gh1p257m29u8c4p09p/editor/serviceAccount:ajec7uhkm7ep6ltnnls9]
yandex_iam_service_account_static_access_key.sa-static-key: Refreshing state... [id=ajecg0shkh0l920d7r4p]
yandex_storage_bucket.rziankins-bucket: Refreshing state... [id=rziankins-bucket]
local_file.Config_backend: Refreshing state... [id=80a4e0e907b94ee7bc08d9a3ead00ea69f598942]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
sergei@XWHD911:~/yandex-cloud/terraform/bucket$
```
</details>



###  1.4.2. Проводим проверку, выполнения команды "terraform apply -auto-approve" для конфигурации инфраструктуры

<details>
<summary>terraform apply --auto-approve</summary>

```bash
sergei@XWHD911:~/yandex-cloud/terraform$ terraform apply --auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.k8s-cluster[0] will be created
  + resource "yandex_compute_instance" "k8s-cluster" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "vm-0"
      + id                        = (known after apply)
      + labels                    = {
          + "index" = "0"
        }
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH6N/0+q5CNzN9QpDeEG8Z0NK5/MQF8OeQOiAct7RxK/ sergei@XWHD911
            EOT
        }
      + name                      = "vm-0"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v2"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8l04iucc4vsh00rkb1"
              + name        = (known after apply)
              + size        = 30
              + snapshot_id = (known after apply)
              + type        = "network-ssd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

  # yandex_compute_instance.k8s-cluster[1] will be created
  + resource "yandex_compute_instance" "k8s-cluster" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "vm-1"
      + id                        = (known after apply)
      + labels                    = {
          + "index" = "1"
        }
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH6N/0+q5CNzN9QpDeEG8Z0NK5/MQF8OeQOiAct7RxK/ sergei@XWHD911
            EOT
        }
      + name                      = "vm-1"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v2"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-b"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8l04iucc4vsh00rkb1"
              + name        = (known after apply)
              + size        = 30
              + snapshot_id = (known after apply)
              + type        = "network-ssd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

  # yandex_compute_instance.k8s-cluster[2] will be created
  + resource "yandex_compute_instance" "k8s-cluster" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "vm-2"
      + id                        = (known after apply)
      + labels                    = {
          + "index" = "2"
        }
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH6N/0+q5CNzN9QpDeEG8Z0NK5/MQF8OeQOiAct7RxK/ sergei@XWHD911
            EOT
        }
      + name                      = "vm-2"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v2"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-d"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8l04iucc4vsh00rkb1"
              + name        = (known after apply)
              + size        = 30
              + snapshot_id = (known after apply)
              + type        = "network-ssd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

  # yandex_vpc_network.network-dev will be created
  + resource "yandex_vpc_network" "network-dev" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "network-dev"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.subnet-zones[0] will be created
  + resource "yandex_vpc_subnet" "subnet-zones" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet-ru-central1-a"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.10.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

  # yandex_vpc_subnet.subnet-zones[1] will be created
  + resource "yandex_vpc_subnet" "subnet-zones" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet-ru-central1-b"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.10.2.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-b"
    }

  # yandex_vpc_subnet.subnet-zones[2] will be created
  + resource "yandex_vpc_subnet" "subnet-zones" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet-ru-central1-d"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.10.3.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-d"
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip_address_nodes = {
      + vm-0 = (known after apply)
      + vm-1 = (known after apply)
      + vm-2 = (known after apply)
    }
  + internal_ip_address_nodes = {
      + vm-0 = (known after apply)
      + vm-1 = (known after apply)
      + vm-2 = (known after apply)
    }
yandex_vpc_network.network-dev: Creating...
yandex_vpc_network.network-dev: Creation complete after 7s [id=enpv40jrtm0s61dcfhqk]
yandex_vpc_subnet.subnet-zones[0]: Creating...
yandex_vpc_subnet.subnet-zones[1]: Creating...
yandex_vpc_subnet.subnet-zones[2]: Creating...
yandex_vpc_subnet.subnet-zones[2]: Creation complete after 1s [id=fl8360ie0hnqi0601kc4]
yandex_vpc_subnet.subnet-zones[1]: Creation complete after 2s [id=e2lt4pg94d2fcfh3b9v8]
yandex_vpc_subnet.subnet-zones[0]: Creation complete after 2s [id=e9be3vhri8g88pvrck94]
yandex_compute_instance.k8s-cluster[2]: Creating...
yandex_compute_instance.k8s-cluster[1]: Creating...
yandex_compute_instance.k8s-cluster[0]: Creating...
yandex_compute_instance.k8s-cluster[2]: Still creating... [10s elapsed]
yandex_compute_instance.k8s-cluster[0]: Still creating... [10s elapsed]
yandex_compute_instance.k8s-cluster[1]: Still creating... [10s elapsed]
yandex_compute_instance.k8s-cluster[2]: Still creating... [20s elapsed]
yandex_compute_instance.k8s-cluster[1]: Still creating... [20s elapsed]
yandex_compute_instance.k8s-cluster[0]: Still creating... [20s elapsed]
yandex_compute_instance.k8s-cluster[2]: Still creating... [30s elapsed]
yandex_compute_instance.k8s-cluster[1]: Still creating... [30s elapsed]
yandex_compute_instance.k8s-cluster[0]: Still creating... [30s elapsed]
yandex_compute_instance.k8s-cluster[2]: Creation complete after 32s [id=fv40upsi69tdamcm83n3]
yandex_compute_instance.k8s-cluster[1]: Still creating... [40s elapsed]
yandex_compute_instance.k8s-cluster[0]: Still creating... [40s elapsed]
yandex_compute_instance.k8s-cluster[1]: Creation complete after 43s [id=epdu8nnescqbiaakbcdt]
yandex_compute_instance.k8s-cluster[0]: Still creating... [50s elapsed]
yandex_compute_instance.k8s-cluster[0]: Still creating... [1m0s elapsed]
yandex_compute_instance.k8s-cluster[0]: Still creating... [1m10s elapsed]
yandex_compute_instance.k8s-cluster[0]: Creation complete after 1m15s [id=fhmjttc7qu41es5dteiq]

Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_nodes = {
  "vm-0" = "51.250.65.18"
  "vm-1" = "51.250.100.25"
  "vm-2" = "51.250.37.143"
}
internal_ip_address_nodes = {
  "vm-0" = "10.10.1.24"
  "vm-1" = "10.10.2.14"
  "vm-2" = "10.10.3.4"
}
sergei@XWHD911:~/yandex-cloud/terraform$
```
</details>

---
- [x] Подготовленная инфрастуктура

![4](https://github.com/RziankinS/devops-netology/blob/85cef33b057292592f00105e658550c714542500/screen/project/%D0%B8%D0%BD%D1%84%D1%80%D0%B0%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0.png)

---

![5](https://github.com/RziankinS/devops-netology/blob/ca6d747d9463e0a73f462f7f459f52df051706ad/screen/project/vms.png)
---

## 2. Создание Kubernetes кластера

- [x] Cоздания кластера k8s выполняется при помощи Kubespray
- [x] Объявляем наши IP-адреса:
```bash
sergei@XWHD911:~/yandex-cloud/kubespray$ declare -a IPS=(51.250.65.18 51.250.100.25 51.250.37.143)
sergei@XWHD911:~/yandex-cloud/kubespray$ CONFIG_FILE=inventory/mycluster/hosts.yaml python3.11 contrib/inventory_builder/inventory.py ${IPS[@]}
DEBUG: Adding group all
DEBUG: Adding group kube_control_plane
DEBUG: Adding group kube_node
DEBUG: Adding group etcd
DEBUG: Adding group k8s_cluster
DEBUG: Adding group calico_rr
DEBUG: adding host node1 to group all
DEBUG: adding host node2 to group all
DEBUG: adding host node3 to group all
DEBUG: adding host node1 to group etcd
DEBUG: adding host node2 to group etcd
DEBUG: adding host node3 to group etcd
DEBUG: adding host node1 to group kube_control_plane
DEBUG: adding host node2 to group kube_control_plane
DEBUG: adding host node1 to group kube_node
DEBUG: adding host node2 to group kube_node
DEBUG: adding host node3 to group kube_node
sergei@XWHD911:~/yandex-cloud/kubespray$
```
- [x] Прописываем хосты в kubespray/inventory/mycluster/hosts.yaml
```yaml
all:
  hosts:
    node1:
      ansible_host: 51.250.65.18
      ip: 10.10.1.24
    node2:
      ansible_host: 51.250.100.25
      ip: 10.10.2.14
    node3:
      ansible_host: 51.250.37.143
      ip: 10.10.3.4
  children:
    kube_control_plane:
      hosts:
        node1:
    kube_node:
      hosts:
        node2:
        node3:
    etcd:
      hosts:
        node1:
    k8s_cluster:
      children:
        kube_control_plane:
        kube_node:
    calico_rr:
      hosts: {}
```
- [x] Раскомментируем строку и дописываем ip мастер-ноды в: /kubespray/inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml

```
 "supplementary_addresses_in_ssl_keys: [51.250.65.18]"
```

- [x] Запускаем плейбук:
```bash
sergei@XWHD911:~/yandex-cloud/kubespray$ ansible-playbook -i inventory/mycluster/hosts.yaml -u ubuntu --become --become-user=root cluster.yml -v
```
- [x] Дожидаемся успешного выполнения:

![6](https://github.com/RziankinS/devops-netology/blob/c78c5ee15151c3d058a891821c2268e449a93ae1/screen/project/%D0%B2%D1%8B%D0%B2%D0%BE%D0%B4%20%D0%BF%D0%BB%D0%B5%D0%B9%D0%B1%D1%83%D0%BA%D0%B0.png)

- [x]  Копируем себе "kube/config": 

```bash     
sergei@XWHD911:~/yandex-cloud/kubespray$ mkdir -p ~/.kube 
sergei@XWHD911:~/yandex-cloud/kubespray$ scp ubuntu@51.250.65.18:~/.kube/config ~/.kube/config
```
- [x] Указываем публичный IP мастер-ноды:
```
server: https://51.250.65.18:6443
```
- [x] kubectl get pods --all-namespaces:

![7](https://github.com/RziankinS/devops-netology/blob/3c18e157c75adc67b51f1c4866f1089335cd16ec/screen/project/all%20namespaces.png)
---

## 3. Создание тестового приложения

- [x] [Git репозиторий](https://github.com/RziankinS/mynginxrepo) с тестовым приложением и [Dockerfile](https://github.com/RziankinS/mynginxrepo/blob/d97ab0a95d88bb210e5ec9ee6f3311a66c4abc36/Dockerfile).
- [x] [Регистри с собранным docker image:DockerHub](https://hub.docker.com/repository/docker/rziankins/testing_dev_stend/tags).

![8](https://github.com/RziankinS/devops-netology/blob/bbcd9ff4f1676ab1c7a84e42a511ffba92ed8455/screen/project/docker_build.png)

---
![9](https://github.com/RziankinS/devops-netology/blob/bbcd9ff4f1676ab1c7a84e42a511ffba92ed8455/screen/project/dockerhub.png) 
---

## 4. Подготовка cистемы мониторинга и деплой приложения

### 4.1. Создаем namespace monitoring:

![10](https://github.com/RziankinS/devops-netology/blob/c6fa0c5e468d9163fb4e5d6d94c2c74afe4b163a/screen/project/namespace%20monitoring.png)

---

### 4.2. Деплой при помощи Helm charts:

![11](https://github.com/RziankinS/devops-netology/blob/a530dbae8a2c48256c6404a5a031329cb719c759/screen/project/helm.png)

### 4.3. Статус мониторинга:

![12](https://github.com/RziankinS/devops-netology/blob/6e01abd408f7751b7169fc96a6c7d81b61f04eff/screen/project/status_monitoring.png)

---
- [x] Для доступа к мониторингу необходимо сменить тип сервиса и добавить внешний порт:
```bash
sergei@XWHD911:~/yandex-cloud$ kubectl get svc stable-kube-prometheus-sta-prometheus -n monitoring
NAME                                    TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
stable-kube-prometheus-sta-prometheus   NodePort   10.233.48.11   <none>        9090:30100/TCP   26m
sergei@XWHD911:~/yandex-cloud$ kubectl get svc stable-kube-prometheus-sta-prometheus -n monitoring -o jsonpath='{.spec.ports[0].nodePort}'
30100

sergei@XWHD911:~/yandex-cloud$ kubectl edit svc stable-grafana -n monitoring
service/stable-grafana edited
sergei@XWHD911:~/yandex-cloud$ kubectl get svc stable-grafana -n monitoring
NAME             TYPE       CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
stable-grafana   NodePort   10.233.9.69   <none>        80:30090/TCP   42m
sergei@XWHD911:~/yandex-cloud$ kubectl get svc stable-grafana -n monitoring -o jsonpath='{.spec.ports[0].nodePort}'
30090
```
![13](https://github.com/RziankinS/devops-netology/blob/d03dd85fab945f40d2ba9050f05d3760a3a6b069/screen/project/kubectl%20get%20svc.png)

---
### 4.4. Http доступ к web интерфейсу Grafana:
- Grafana http://51.250.65.18:30090/
- Логин:```admin``` Пароль:```prom-operator```
![14](https://github.com/RziankinS/devops-netology/blob/d03dd85fab945f40d2ba9050f05d3760a3a6b069/screen/project/grafana.png)

---
### 4.5. Разворачиваем тестовое приложение:
[deployment.yml](https://github.com/RziankinS/Project/blob/a9bc5ed2d3bf6bff26c05e4a9deaa3bad8113f29/mynginxrepo/deploy/deployment.yml)

```bash
sergei@XWHD911:~/yandex-cloud$ kubectl create -f ~/yandex-cloud/mynginxrepo/devops-netology/project/mynginxrepo/deploy/deployment.yml
daemonset.apps/myapp created
service/myapp-service created
sergei@XWHD911:~/yandex-cloud$ kubectl get all -n monitoring
NAME                                                         READY   STATUS    RESTARTS      AGE
pod/alertmanager-stable-kube-prometheus-sta-alertmanager-0   2/2     Running   0             97m
pod/myapp-j6wdc                                              1/1     Running   0             56s
pod/myapp-sm6zh                                              1/1     Running   0             56s
pod/prometheus-stable-kube-prometheus-sta-prometheus-0       2/2     Running   0             97m
pod/stable-grafana-9db4fb8d8-lhpmz                           3/3     Running   0             97m
pod/stable-kube-prometheus-sta-operator-646df9869-gjw5t      1/1     Running   0             97m
pod/stable-kube-state-metrics-9bdbc947-khdcs                 1/1     Running   1 (91m ago)   97m
pod/stable-prometheus-node-exporter-gcrrc                    1/1     Running   0             97m
pod/stable-prometheus-node-exporter-knckx                    1/1     Running   0             97m
pod/stable-prometheus-node-exporter-tdwjw                    1/1     Running   0             97m
```
![15](https://github.com/RziankinS/devops-netology/blob/04cf78872b7456fb0794dbc6303c2843b4a1a66e/screen/project/myapp.png)

---
- [x] Http доступ к тестовому приложению:
- Тестовое приложение http://51.250.65.18:31000/
![16](https://github.com/RziankinS/devops-netology/blob/f37f5bbc9bd0673e187fdcc06064516e96839571/screen/project/test.png)
---

## 5. Установка и настройка CI/CD через GitHub Actions

- [x] Для автоматической сборки и деплоя приложения настраиваем [workflows](https://github.com/RziankinS/mynginxrepo/blob/d97ab0a95d88bb210e5ec9ee6f3311a66c4abc36/.github/workflows/main.yml)
      
- [x] Происходит сборка приложения:
      
![17](https://github.com/RziankinS/devops-netology/blob/74a72f1a96ff03a71c9f1d56e0b2fdf85629c6cd/screen/project/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%20%D0%BE%D1%82%202024-10-12%2017-16-16.png)
![18](https://github.com/RziankinS/devops-netology/blob/74a72f1a96ff03a71c9f1d56e0b2fdf85629c6cd/screen/project/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%20%D0%BE%D1%82%202024-10-12%2017-16-31.png)
![19](https://github.com/RziankinS/devops-netology/blob/74a72f1a96ff03a71c9f1d56e0b2fdf85629c6cd/screen/project/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%20%D0%BE%D1%82%202024-10-12%2017-23-07.png)

---
- [x] Вносим изменения:

![20](https://github.com/RziankinS/devops-netology/blob/74a72f1a96ff03a71c9f1d56e0b2fdf85629c6cd/screen/project/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%20%D0%BE%D1%82%202024-10-12%2018-15-26.png)

![21](https://github.com/RziankinS/devops-netology/blob/74a72f1a96ff03a71c9f1d56e0b2fdf85629c6cd/screen/project/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%20%D0%BE%D1%82%202024-10-12%2018-16-11.png)

![22](https://github.com/RziankinS/devops-netology/blob/74a72f1a96ff03a71c9f1d56e0b2fdf85629c6cd/screen/project/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%20%D0%BE%D1%82%202024-10-12%2018-17-19.png)

![23](https://github.com/RziankinS/devops-netology/blob/c6fe6181fd0267874a9f9d75b05c96e675ff6b97/screen/project/git%20push%20v202.png)

![24](https://github.com/RziankinS/devops-netology/blob/74a72f1a96ff03a71c9f1d56e0b2fdf85629c6cd/screen/project/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%20%D0%BE%D1%82%202024-10-12%2018-26-40.png)

![25](https://github.com/RziankinS/devops-netology/blob/74a72f1a96ff03a71c9f1d56e0b2fdf85629c6cd/screen/project/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%20%D0%BE%D1%82%202024-10-12%2018-57-00.png)

---
- [x] Интерфейс ci/cd сервиса доступен по http:
[mynginxrepo](https://github.com/RziankinS/mynginxrepo/actions)
