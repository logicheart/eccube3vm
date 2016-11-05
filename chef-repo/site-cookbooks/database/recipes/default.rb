#
# Cookbook Name:: database
# Recipe:: default
#
# Copyright 2015, LogicHeart
#
# All rights reserved - Do Not Redistribute
#
host = node["database"]["host"]
root_password = node["database"]["root_password"]
databases = node["database"]["databases"]

databases.each do |database|
  sqlfile = Chef::Config[:file_cache_path] + "/" + database + "_" + DateTime.now.strftime('%Y%m%d%H%M%S') + ".sql"
  template database do
    source "createdb.sql.erb"
    path sqlfile
    variables({
      database: database,
      user: node["database"][database]["user"],
      password: node["database"][database]["password"],
    })
  end

  execute "createdb" do
    command "mysql -h #{host} -u root -p#{root_password} < #{sqlfile}"
#    not_if do
#      require 'rubygems'
#      Gem.clear_paths
#      require 'mysql'
#      mysql = Mysql.new(host, "root", root_password)
#      mysql.list_dbs.include?(database)
#    end
  end
end
