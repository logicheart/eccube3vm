#
# Cookbook Name:: php70
# Recipe:: default
#
# Copyright 2015, LogicHeart
#
# All rights reserved - Do Not Redistribute
#

# yum-remi
include_recipe 'yum-remi-chef::remi'
include_recipe 'yum-remi-chef::remi-php70'

# PHP 7.0
node["php70"]["packages"].each do |p|
  package p do
    action :install
    options "--enablerepo=remi --enablerepo=remi-php70"
  end
end

# php.ini
template "/etc/php.ini" do
  source "php.ini.erb"
  variables({
    :timezone => node["php70"]["timezone"]
  })
end

# php-fpm
service "php-fpm" do
  action [ :enable, :start ]
end
