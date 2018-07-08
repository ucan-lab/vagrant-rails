# https://www.vagrantup.com/docs/index.html
BOX_NAME = "centos/7"
Vagrant.configure("2") do |config|
  config.vm.box = BOX_NAME
  # ネットワーク
  config.vm.network :private_network, ip: "192.168.33.99"
  # 共有フォルダ
  config.vm.synced_folder ".", "/home/vagrant/work"
  # プロビジョニング
  config.vm.provision :bootstrap_root_user, type: "shell", path: "vagrant/#{BOX_NAME}/bootstrap_root_user.sh"
  config.vm.provision :bootstrap_general_user, type: "shell", path: "vagrant/#{BOX_NAME}/bootstrap_general_user.sh", privileged: false

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", "2", "--ioapic", "on"]
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
