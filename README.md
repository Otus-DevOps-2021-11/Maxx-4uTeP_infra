# HW 5
Maxx-4uTeP Infra repository

bastion_IP = 62.84.114.79
someinternalhost_IP = 10.128.0.28

# HW 6
testapp_IP = 51.250.5.142
testapp_port = 9292

```bash
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=./metadata.yml
```
# Выполнено ДЗ №7

 - [v] Основное ДЗ
 - [v] Задание со *
 - [v] Задание со **

## В процессе сделано:
 - Всё по методичке:
 - Создал сервисный акк, создал образ. Проверил что всё ок работает.
 - Вынес критичные данные в переменные. Пострадал, что не проходит проверка, беглый help рассказал про опцию -var-file= )))
 - Всё заработало. Но дальше есть еще звездочки, а они интересные.
 - Чуток поправил файл packer/files/deploy.sh от прошлого урока, добавив в него создание системюнита.
 - В файле config-scripts/create-reddit-vm.sh команда для создания ВМ из созданного выше образа.

## Как запустить проект:
```bash  
yc compute instance create \
  --name test-vm-from-image \
  --memory=2 \
  --zone ru-central1-a \
  --create-boot-disk name=disk1,size=10,image-id=fd8n6pna3h5ovor90m4u \
  --public-ip \
  --ssh-key ~/.ssh/id_rsa.pub
```
## Как проверить работоспособность:
 - Например, перейти по ссылке http://VM_PUB_IP:9292

## PR checklist
 - [v] Выставил label с номером домашнего задания
 - [v] Выставил label с темой домашнего задания
