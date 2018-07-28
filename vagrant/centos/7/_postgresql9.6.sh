echo -------------------------------------------------
echo
echo                    PostgreSQL 9.6
echo
echo -------------------------------------------------

# リポジトリ追加
yum -y install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7.4-x86_64/pgdg-centos96-9.6-3.noarch.rpm

# PostgreSQL9.6インストール
yum -y install postgresql96-server postgresql96-devel

# 初期設定
/usr/pgsql-9.6/bin/postgresql96-setup initdb

# 設定ファイルバックアップ
cp /var/lib/pgsql/9.6/data/postgresql.conf /var/lib/pgsql/9.6/data/postgresql.conf.org
cp /var/lib/pgsql/9.6/data/pg_hba.conf /var/lib/pgsql/9.6/data/pg_hba.conf.org

# 設定ファイルコピー
cp $PROVISION/conf/postgresql9.6/postgresql.conf /var/lib/pgsql/9.6/data/postgresql.conf
cp $PROVISION/conf/postgresql9.6/pg_hba.conf /var/lib/pgsql/9.6/data/pg_hba.conf

# PostgreSQL起動&有効化
systemctl start postgresql-9.6
systemctl enable postgresql-9.6

# vagrantユーザーの作成
sudo -u postgres psql -c "CREATE ROLE vagrant WITH LOGIN SUPERUSER;"
