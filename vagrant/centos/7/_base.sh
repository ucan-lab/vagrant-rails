#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    yum 高速化設定
echo
echo -------------------------------------------------

cp /etc/yum/pluginconf.d/fastestmirror.conf /etc/yum/pluginconf.d/fastestmirror.conf.org

sed -e "s/^include_only//" /etc/yum/pluginconf.d/fastestmirror.conf
sed -e "s/^prefer//" /etc/yum/pluginconf.d/fastestmirror.conf

cat << EOS | sudo tee -a /etc/yum/pluginconf.d/fastestmirror.conf
include_only=.jp
prefer=ftp.iij.ad.jp
EOS

echo -------------------------------------------------
echo
echo                    基本設定
echo
echo -------------------------------------------------

yum -y update
yum -y install kernel kernel-devel
yum -y groupinstall "Base" "Development tools" "Japanese Support"

echo -------------------------------------------------
echo
echo                    ユーティリティー
echo
echo -------------------------------------------------

yum -y install epel-release
yum -y install tree pv dstat man-pages-ja zsh

echo -------------------------------------------------
echo
echo                    タイムゾーン設定
echo
echo -------------------------------------------------

timedatectl set-timezone Asia/Tokyo

echo -------------------------------------------------
echo
echo                    言語、キーボード設定
echo
echo -------------------------------------------------

localedef -f UTF-8 -i ja_JP ja_JP.utf8
localectl set-locale LANG=ja_JP.utf8
localectl set-keymap jp106

echo -------------------------------------------------
echo
echo                    SELinux 無効化
echo
echo -------------------------------------------------

setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

echo -------------------------------------------------
echo
echo                    yum 自動更新設定
echo
echo -------------------------------------------------

yum -y install yum-cron
cp /etc/yum/yum-cron.conf /etc/yum/yum-cron.conf.org
sed -i 's/apply_updates = no/apply_updates = yes/' /etc/yum/yum-cron.conf
systemctl start yum-cron
systemctl enable yum-cron

echo -------------------------------------------------
echo
echo                    Git
echo
echo -------------------------------------------------

yum -y remove git
yum -y install https://centos7.iuscommunity.org/ius-release.rpm
yum -y install git2u

yum -y install yum-utils
yum-config-manager --disable ius

echo -------------------------------------------------
echo
echo                    chrony NTP設定
echo
echo -------------------------------------------------

yum -y install chrony
systemctl start chronyd
systemctl enable chronyd
