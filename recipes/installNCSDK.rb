
directory '/NeuralComputeStick' do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end
directory '/NeuralComputeStick/workspace' do
  owner 'root'
  group 'root'
  mode '0777'
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
execute 'make install' do
  cwd '/NeuralComputeStick/workspace/ncsdk'
  command 'make install'
  action :run
end
