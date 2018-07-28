echo -------------------------------------------------
echo
echo                    PostgreSQL 10
echo
echo -------------------------------------------------

# リポジトリ追加
yum -y install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-redhat10-10-2.noarch.rpm

# PostgreSQL10.0インストール
yum -y install postgresql10-server postgresql10-devel

# 初期設定
/usr/pgsql-10/bin/postgresql-10-setup initdb

# 設定ファイルバックアップ
cp /var/lib/pgsql/10/data/postgresql.conf /var/lib/pgsql/10/data/postgresql.conf.org
cp /var/lib/pgsql/10/data/pg_hba.conf /var/lib/pgsql/10/data/pg_hba.conf.org

# 設定ファイルコピー
cp $PROVISION/conf/postgresql10/postgresql.conf /var/lib/pgsql/10/data/postgresql.conf
cp $PROVISION/conf/postgresql10/pg_hba.conf /var/lib/pgsql/10/data/pg_hba.conf

# PostgreSQL起動&有効化
systemctl start postgresql-10
systemctl enable postgresql-10

# vagrantユーザーの作成
sudo -u postgres psql -c "CREATE ROLE vagrant WITH LOGIN SUPERUSER;"
