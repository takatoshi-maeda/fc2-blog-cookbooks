task :bootstrap do |task, args|
  Rake::Task[:setup].invoke
  Rake::Task[:prepare].invoke
  Rake::Task[:apply].invoke
end

task :setup do |task, args|
  system 'bundle', 'exec', 'berks', 'install', '--path=./cookbooks'
  system 'vagrant', 'up'
end

task :prepare do |task, args|
  system 'bundle', 'exec', 'knife', 'solo', 'prepare', '-i', "#{ENV["HOME"]}/.vagrant.d/insecure_private_key", 'vagrant@192.168.33.10'
end

task :apply do |task, args|
  system 'bundle', 'exec', 'knife', 'solo', 'cook', 'vagrant@192.168.33.10', '-i', "#{ENV["HOME"]}/.vagrant.d/insecure_private_key", '-N', 'fc2blog'
end
