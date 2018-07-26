#!/bin/bash -eu

# 一般ユーザー(vagrant)で実行する

echo -------------------------------------------------
echo
echo                    設定
echo
echo -------------------------------------------------

PROVISION=/vagrant

echo -------------------------------------------------
echo
echo                    Git 設定
echo
echo -------------------------------------------------

# git の出力に色を付ける
git config --global color.ui true
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
# git パーミッションの変更を無視
git config --global core.filemode false
# git ファイル名の大文字・小文字の変更を検知
git config --global core.ignorecase false

echo -------------------------------------------------
echo
echo                    共通設定
echo
echo -------------------------------------------------

\cp -f $PROVISION/vagrant/common/.bash_aliases ~/.bash_aliases
\cp -f $PROVISION/vagrant/common/.bashrc ~/.bashrc
\cp -f $PROVISION/vagrant/common/.zsh_aliases ~/.zsh_aliases
\cp -f $PROVISION/vagrant/common/.zshrc ~/.zshrc
\cp -f $PROVISION/vagrant/common/.mylogin.cnf ~/.mylogin.cnf
\cp -f $PROVISION/vagrant/common/.ssh/config ~/.ssh/config

chmod 600 ~/.mylogin.cnf
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*

echo -------------------------------------------------
echo
echo                    bootstrap_default_user.sh Success !!
echo
echo -------------------------------------------------
