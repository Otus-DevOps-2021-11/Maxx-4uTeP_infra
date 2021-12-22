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
