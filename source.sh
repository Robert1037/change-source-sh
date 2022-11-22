#!/bin/bash
echo "###########################################################"
echo "# This script helps you to replace your Ubuntu apt source #"
echo "###########################################################"
echo "(1)22.04 (2)20.04 (3)18.04 (4)16.04"
read -p "Chose a Ubuntu LTS version: [1/2/3/4] " ver
case ${ver} in
    '1')
        ver='jammy'
        ;;
    '2')
        ver='focal'
        ;;
    '3')
        ver='bionic'
        ;;
    '4')
        ver='xenial'
        ;;
    *)
        echo "Exit"; exit 0
        ;;
esac
echo "(1)ustc (2)tsinghua (3)aliyun (4)cloud.tencent (5)huaweicloud (6)cn.ubuntu"
read -p "Chose a source: [1/2/3/4/5/6] " src
case ${src} in
    '1')
        src='mirrors.ustc.edu.cn'
        ;;
    '2')
        src='mirrors.tuna.tsinghua.edu.cn'
        ;;
    '3')
        src='mirrors.aliyun.com'
        ;;
    '4')
        src='mirrors.cloud.tencent.com'
        ;;
    '5')
        src='repo.huaweicloud.com'
        ;;
    '6')
        src='cn.archive.ubuntu.com'
        ;;
    *)
        echo "Exit"; exit 0
        ;;
esac
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo echo "\
deb https://${src}/ubuntu/ ${ver} main restricted universe multiverse
# deb-src https://${src}/ubuntu/ ${ver} main restricted universe multiverse
deb https://${src}/ubuntu/ ${ver}-security main restricted universe multiverse
# deb-src https://${src}/ubuntu/ ${ver}-security main restricted universe multiverse
deb https://${src}/ubuntu/ ${ver}-updates main restricted universe multiverse
# deb-src https://${src}/ubuntu/ ${ver}-updates main restricted universe multiverse
deb https://${src}/ubuntu/ ${ver}-backports main restricted universe multiverse
# deb-src https://${src}/ubuntu/ ${ver}-backports main restricted universe multiverse" > /etc/apt/sources.list
sudo apt update