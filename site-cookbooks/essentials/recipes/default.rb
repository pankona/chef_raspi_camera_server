#
# Cookbook Name:: libjpeg
# Recipe:: default
#
# Copyright 2014, pankona
#
# All rights reserved - Do Not Redistribute
#

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
