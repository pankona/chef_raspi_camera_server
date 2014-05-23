#
# Cookbook Name:: libjpeg
# Recipe:: default
#
# Copyright 2014, pankona
#
# All rights reserved - Do Not Redistribute
#

bash 'time adjust' do
  action :run
  code <<-BASHCODE
    date -s "$(curl -s --head http://www.google.co.jp | grep ^Date | cut -b 7-)"
  BASHCODE
end

package 'git' do
  action :install
end

package 'libjpeg-turbo' do
  action :install
end

package 'cmake' do
  action :install
end

package 'subversion' do
  action :install
end

gem_package "bundler" do
  action :install
end

package "python2" do
  action :install
end
