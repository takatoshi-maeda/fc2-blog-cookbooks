include_recipe "mysql::server"
include_recipe "mysql::client"
include_recipe 'nginx'
include_recipe 'database::mysql'

database_connection = {
  :host => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database node['fc2-blog']['database']['name'] do
  connection database_connection
  action :create
end

mysql_database_user node['fc2-blog']['database']['user'] do
  connection database_connection
  password node['fc2-blog']['database']['password']
  database_name node['fc2-blog']['database']['name']
  privileges [ :all ]
  action [:create, :grant]
end

directory '/var/www/html/' do
  owner node["nginx"]["user"]
  group node["nginx"]["group"]
end

git "/var/www/html/fc2-blog" do
  repository "https://github.com/fc2blog/blog.git"
  revision "HEAD"
  action :sync
  user node["nginx"]["user"]
  group node["nginx"]["group"]
  notifies :restart, "service[php-fpm]"
end

template "/var/www/html/fc2-blog/public/config.php" do
  source "fc2-blog_config.php.erb"
  mode 0644
  user node["nginx"]["user"]
  group node["nginx"]["group"]
end

directory "/var/lib/php/session" do
  owner "nginx"
  group "nginx"
  recursive true
  notifies :restart, "service[nginx]"
  notifies :restart, "service[php-fpm]"
end

file "/etc/nginx/conf.d/default.conf" do
  action :delete
  notifies :restart, "service[nginx]"
end

template "/etc/nginx/sites-available/fc2-blog" do
  source "nginx.conf.erb"
  mode 0644
  user node["nginx"]["user"]
  group node["nginx"]["group"]
  notifies :restart, "service[nginx]"
end

nginx_site 'default' do
  enable false
end

nginx_site 'fc2-blog' do
  enable true
end
