echo -------------------------------------------------
echo
echo                    rbenv
echo
echo -------------------------------------------------

# 必要なパッケージのインストール
yum install -y gcc gcc-c++ openssl-devel readline-devel

# rbenv グループ
groupadd rbenv

# rbenv, ruby-buildインストール
git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
git clone git://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

# ユーザーログイン時に実行するスクリプト
echo 'export RBENV_ROOT="/usr/local/rbenv"'     > /etc/profile.d/rbenv.sh
echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init --no-rehash -)"'      >> /etc/profile.d/rbenv.sh

chmod 0644 /etc/profile.d/rbenv.sh
. /etc/profile.d/rbenv.sh

# rbenvの持ち主とパーミッション変更
chown -R vagrant:rbenv /usr/local/rbenv
chmod -R 755 /usr/local/rbenv

# rbenv グループに 一般ユーザーを追加
usermod -aG rbenv vagrant
