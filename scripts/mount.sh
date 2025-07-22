#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "此脚本需要 root 权限，请使用 sudo 运行"
  exit 1
fi

mount -t cifs //192.168.1.2/public/model-hub /home/wh/model-hub \
  -o vers=3.0,username=ops,password=w3O6rofq6Kel,uid=wh,gid=users,rw
if [ $? -eq 0 ]; then
  echo "✓ 成功挂载 model-hub"
else
  echo "✗ 挂载 model-hub 失败"
fi

mount -t nfs 192.168.1.2:/volume1/homes/wh /home/wh/nas -o nolock
if [ $? -eq 0 ]; then
  echo "✓ 成功挂载 nas"
else
  echo "✗ 挂载 nas 失败"
fi

mount -t cifs //192.168.1.2/public /home/wh/public \
  -o vers=3.0,username=wh,password="4D2EKc@:",uid=wh,gid=users,rw
if [ $? -eq 0 ]; then
  echo "✓ 成功挂载 public"
else
  echo "✗ 挂载 public 失败"
fi
