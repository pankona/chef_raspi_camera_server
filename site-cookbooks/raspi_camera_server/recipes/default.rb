#
# Cookbook Name:: raspi_camera_server
# Recipe:: default
#
# Copyright 2014, pankona
#
# All rights reserved - Do Not Redistribute
#

deploy_revision '/usr/local/raspi_camera_server' do
  repository 'https://github.com/pankona/raspi_camera_server.git'
  migrate false
  environment "RAILS_ENV" => "development"
  action :deploy
  before_restart do
    bash "bundle install" do
      cwd release_path
      code <<-BASHCODE
        bundle install --path=./vendor/bundle
      BASHCODE
    end
  end
  restart_command "touch /tmp/restart.txt"
end
