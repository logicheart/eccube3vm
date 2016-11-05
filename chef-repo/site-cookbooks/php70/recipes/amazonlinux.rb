#
# Cookbook Name:: php70
# Recipe:: amazonlinux
#
# Copyright 2015, LogicHeart
#
# All rights reserved - Do Not Redistribute
#

# Remove default PHP
['php-common,', 'php'].each do |p|
  yum_package p do
    action :remove
  end
end

# webtalic
include_recipe 'yum-webtatic'

# PHP 7.0
node["php70"]["packages"].each do |p|
  yum_package p do
    action :install
    options "--enablerepo=webtatic"
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
