#
# Cookbook Name:: mjpg_streamer
# Recipe:: default
#
# Copyright 2014, pankona
#
# All rights reserved - Do Not Redistribute
#

bash 'after_sync' do
  user 'aka'
  group 'aka'
  action :nothing
  flags '-x'
  code <<-__EOL__
    cd /home/aka/mjpg-streamer/mjpg-streamer-experimental
    make
    sudo make install
  __EOL__
end

git '/home/aka/mjpg-streamer' do
  user 'aka'
  group 'aka'
  action :sync
  repository 'https://github.com/jacksonliam/mjpg-streamer.git'
  notifies :run, 'bash[after_sync]'
end
