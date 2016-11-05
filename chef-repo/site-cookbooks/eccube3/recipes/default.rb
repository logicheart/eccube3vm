#
# Cookbook Name:: bellwedding
# Recipe:: default
#
# Copyright 2015, LogicHeart
#
# All rights reserved - Do Not Redistribute
#
template 'bellwedding.conf' do |variable|
  path '/etc/nginx/conf.d/bellwedding.conf'
  source "bellwedding.conf.erb"
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, "service[nginx]"
end

service 'nginx' do
  action :nothing
end
