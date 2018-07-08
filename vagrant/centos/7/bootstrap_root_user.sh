#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    設定
echo
echo -------------------------------------------------

PROVISION=/vagrant/vagrant/centos/7
DB_PASSWORD=P@ssw0rd

echo -------------------------------------------------
echo
echo                    基本
echo
echo -------------------------------------------------

. $PROVISION/_base.sh

echo -------------------------------------------------
echo
echo                    Ruby
echo
echo -------------------------------------------------

. $PROVISION/_rbenv.sh
. $PROVISION/_ruby2.5.1.sh

echo -------------------------------------------------
echo
echo                    MySQL
echo
echo -------------------------------------------------

# . $PROVISION/_mysql5.6.sh
. $PROVISION/_mysql5.7.sh
# . $PROVISION/_mysql8.0.sh

echo -------------------------------------------------
echo
echo                    PostgreSQL
echo
echo -------------------------------------------------

# . $PROVISION/_postgresql9.6.sh
. $PROVISION/_postgresql10.sh

echo -------------------------------------------------
echo
echo                    SQLite
echo
echo -------------------------------------------------

# . $PROVISION/_sqlite3.sh

echo -------------------------------------------------
echo
echo                    Nodejs
echo
echo -------------------------------------------------

# . $PROVISION/_nodejs8.sh
. $PROVISION/_nodejs10.sh

echo -------------------------------------------------
echo
echo                    Heroku
echo
echo -------------------------------------------------

. $PROVISION/_heroku.sh

echo -------------------------------------------------
echo
echo                    yarn
echo
echo -------------------------------------------------

. $PROVISION/_yarn1.7.sh

echo -------------------------------------------------
echo
echo                    クリア
echo
echo -------------------------------------------------

yum clean all
history -c
