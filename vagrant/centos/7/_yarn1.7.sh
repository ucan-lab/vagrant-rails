echo -------------------------------------------------
echo
echo                    yarn1.7
echo
echo -------------------------------------------------

curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
yum -y install yarn
