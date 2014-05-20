#
# Cookbook Name:: mjpg_streamer
# Recipe:: default
#
# Copyright 2014, pankona
#
# All rights reserved - Do Not Redistribute
#

bash 'after_sync' do
  action :nothing
  flags '-x'
  code <<-__EOL__
    cd /usr/local/mjpg-streamer/mjpg-streamer-experimental
    ./configure
    make
    make install
  __EOL__
end

git '/usr/local/mjpg-streamer' do
  action :sync
  repository 'git@github.com:jacksonliam/mjpg-streamer.git'
  notifies :run, 'bash[after_sync]'
end
