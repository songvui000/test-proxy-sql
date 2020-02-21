# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:
user_name = 'vagrant'
server "127.0.0.1", user: user_name, port: 2222, roles: %w{app db web}

set :branch, 'master'
# set :branch, 'feature/test-check-table'
set :user, user_name
set :rails_env, 'staging'
set :deploy_to, "/home/#{fetch(:user)}/staging/back-end/"
set :keep_releases, 2
set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  keys: %w[/Users/anhvirt/workspaces/first-vargant/.vagrant/machines/default/virtualbox/private_key]
}
