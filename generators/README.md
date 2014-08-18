Install VirtualBox: https://www.virtualbox.org/wiki/Downloads #Recommended
Install Vagrant: http://www.vagrantup.com/downloads.html

Install Vagrant Plugins:
vagrant plugin install vagrant-librarian-chef #Runs Chef-solo
vagrant plugin install vagrant-hostsupdater #Always Auto Updating of /etc/hosts (or windows equiv) 

Using VirtualBox?
vagrant plugin install vagrant-vbguest #Auto installs VirtualBox Guest Tools on new boxes

Using Parallels?
vagrant plugin install vagrant-parallels #Allows parallels vagrant boxes