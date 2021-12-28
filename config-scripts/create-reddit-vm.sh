yc compute instance create \
  --name test-vm-from-image \
  --memory=2 \
  --zone ru-central1-a \
  --create-boot-disk name=disk1,size=10,image-id=fd8n6pna3h5ovor90m4u \
  --public-ip \
  --ssh-key ~/.ssh/id_rsa.pub