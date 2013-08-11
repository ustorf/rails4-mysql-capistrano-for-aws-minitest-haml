require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "your-app-name"
set :deploy_to,   "/var/www/your-app-name"
set :user, "ubuntu"

set :repository,  "git@github.com:your_repo/your-app-name.git"

set :scm,         :git
set :branch,      "master"



set :deploy_via, :copy

server "your-server", :app, :web, :db, :primary => true

default_run_options[:pty] = true


set :ssh_options, {:forward_agent => true}
set :ssh_options, {:auth_methods => "publickey"}
set :ssh_options, {:keys => ["/Users/burntkraut/.ssh/your-key.pem"]}

set :keep_releases, 5

set :use_sudo, true

set :rvm_type, :system

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end