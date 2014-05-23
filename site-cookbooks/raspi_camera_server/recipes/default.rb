#
# Cookbook Name:: raspi_camera_server
# Recipe:: default
#
# Copyright 2014, pankona
#
# All rights reserved - Do Not Redistribute
#

deploy_revision '/home/aka/raspi_camera_server' do
  user "aka"
  group "aka"
  repository 'https://github.com/pankona/raspi_camera_server.git'
  migrate false
  environment "RAILS_ENV" => "development"
  action :deploy
  before_symlink do
    bash "mkdir on shared" do
      user "aka"
      group "aka"
      cwd "#{release_path}/../.."
      code <<-BASHCODE
        mkdir -p ./shared/pids
        mkdir -p ./shared/log
      BASHCODE
    end
  end
  before_restart do
    template "#{release_path}/.env" do
      owner "aka"
      group "aka"
      source ".env.erb"
      action :create
    end
    bash "bundle install" do
      user "aka"
      group "aka"
      cwd release_path
      timeout 36000
      code <<-BASHCODE
        source /home/aka/.bash_profile
        bundle install
      BASHCODE
    end
  end
  restart_command "touch /tmp/restart.txt"
end
