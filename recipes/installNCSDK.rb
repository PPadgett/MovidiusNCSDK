
directory '/NeuralComputeStick' do
  owner 'root'
  group 'root'
  mode '0655'
  action :create
end
directory '/NeuralComputeStick/workspace' do
  owner 'root'
  group 'root'
  mode '0655'
  action :create
end
git '/NeuralComputeStick/workspace/ncsdk' do
  repository 'git://github.com/movidius/ncsdk.git'
  revision 'master'
  action :sync
end
git '/NeuralComputeStick/workspace/ncappzoo' do
  repository 'git://github.com/movidius/ncappzoo.git'
  revision 'master'
  action :sync
end
execute 'Make_Install' do
  cwd '/NeuralComputeStick/workspace/ncsdk'
  command 'sudo -H make install'
  action :run
end
execute 'bash' do
  command 'exec bash'
  action :run
end
execute 'Make_Examples' do
  cwd '/NeuralComputeStick/workspace/ncsdk'
  command 'sudo -H make examples'
  action :run
end
