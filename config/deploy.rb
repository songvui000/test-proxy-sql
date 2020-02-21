# config valid for current version and patch releases of Capistrano
lock "~> 3.12.0"

set :application, "test_proxy_sql"
set :repo_url, "git@github.com:songvui000/test-proxy-sql.git"

set :linked_dirs, %w{
  log
  tmp/pids
  tmp/cache
  tmp/sockets
  node_modules
  public/assets
  public/system
}

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'
set :conditionally_migrate, true

set :linked_files, %w{
  config/application.yml
  config/database.yml
  config/credentials.yml.enc
  config/master.key
  config/storage.yml
}

namespace :setup_environment do
  desc 'Upload linked files'
  task :upload_linked_files do
    on roles(:app) do
      if test "[ ! -d #{ shared_path }/config ]"
        execute "mkdir -p #{ shared_path }/config"
      end

      fetch(:linked_files).each do |file_path|
        upload!(file_path, "#{ shared_path }/#{ file_path }")
      end
    end
  end
end