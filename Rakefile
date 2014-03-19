task :setup do
  system 'berks', 'install', '--path=./cookbooks'
end

task :prepare, :node_name do |task, args|
  system 'bundle', 'exec', 'knife', 'solo', 'prepare', '-i', "#{ENV["HOME"]}/.vagrant.d/insecure_private_key", 'vagrant@192.168.33.10'
end

task :apply, :node_name do |task, args|
  system 'bundle', 'exec', 'knife', 'solo', 'cook', 'vagrant@192.168.33.10', '-i', "#{ENV["HOME"]}/.vagrant.d/insecure_private_key", '-N', args.node_name
end
