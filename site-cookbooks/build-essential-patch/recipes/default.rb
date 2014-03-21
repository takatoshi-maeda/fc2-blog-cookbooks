file '/etc/yum.conf' do
  _file = Chef::Util::FileEdit.new(path)
  _file.search_file_replace_line('exclude=kernel', "#exclude=kernel\n")
  content _file.send(:contents).join
  action :create
end.run_action(:create)
