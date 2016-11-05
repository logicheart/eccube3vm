#
# Cookbook Name:: mysql-client
# Recipe:: default
#
# Copyright 2015, LogicHeart
#
# All rights reserved - Do Not Redistribute
#

# MySQL client
mysql_client 'default' do
  version node['mysql-client']['version']
  action :create
end
