#
# Cookbook Name:: centos7
# Recipe:: default
#
# Copyright 2015, hiroyasu55(LogicHeart)
#
# All rights reserved
#

# Disable SELinux
include_recipe "selinux::disabled"

# Local Time
template "/etc/sysconfig/clock" do
  notifies :run, "execute[localtime]", :immediately
end
execute "localtime" do
  command "cp /usr/share/zoneinfo/Japan /etc/localtime"
end

# Locale
execute "Japanese Support" do
  command 'yum -y groupinstall "Japanese Support"'
  action :run
end
execute "localedef" do
  command 'localedef -f UTF-8 -i ja_JP ja_JP.utf8'
  action :run
end
template "/etc/sysconfig/i18n" do
  notifies :run, "bash[update lang]", :immediately
end
bash "update lang" do
  code ". /etc/sysconfig/i18n"
  action :nothing
end

# NTP
include_recipe "ntp"

# iptables
include_recipe "iptables"
iptables_rule 'iptables' do
  action :enable
end

# EPEL repository
yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-7&arch=$basearch'
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7'
  action :create
end

# ClamAV
include_recipe "clamav"

# Update all packages
execute "yum update" do
  command 'yum -y update'
  action :run
end

# Japanese manual pages
package "man-pages-ja" do
  action :install
end

# bind-utils
package "bind-utils" do
  action :install
end
