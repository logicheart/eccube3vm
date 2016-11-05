#
# Cookbook Name:: mysql-server
# Recipe:: default
#
# Copyright 2015, LogicHeart
#
# All rights reserved - Do Not Redistribute
#

mysql_service node['mysql-server']['instance'] do
  version node['mysql-server']['version']
  bind_address '0.0.0.0'
  port node['mysql-server']['port']
  initial_root_password node['mysql-server']['root_password']
  action [:create, :start]
end

package "mysql-devel" do
  action :install
end

#chef_gem "mysql" do
#  action :nothing
#  subscribes :install, "package[mysql-devel]", :immediately
#end
