#Test setup
docker_package = 'docker.io' if os[:family] == 'debian'
docker_package = 'docker' if os[:family] == 'redhat'
consul_home = '/etc/motherbase/consul'
consul_certs = '/etc/motherbase/consul/certs'
consul_data = '/srv/consul/data'
consulrepo = "docker.io/consul:1.0.3" if os[:family] == 'redhat'
consulrepo = "consul:1.0.3" if os[:family] == 'debian'


describe package(docker_package) do
  it { should be_installed }
end

describe docker_image(consulrepo) do
  it { should exist }
  its('id') { should eq 'sha256:cdbd79f2a13ed16e2ed7dd6232c713ae5c637878521790ad3efc74abde4debe6' }
  its('tag') { should eq '1.0.3' }
end

describe directory(consul_home) do
  it { should exist }
  its('mode') { should cmp '00700' }
end

describe directory(consul_certs) do
  it { should exist }
  its('mode') { should cmp '00700' }
end

describe directory(consul_data) do
  it { should exist }
  its('mode') { should cmp '00700' }
end

describe directory('/opt/bin') do
  it { should exist }
  its('mode') { should cmp '00700' }
end

describe file('/opt/bin/systemd-docker') do
  it { should exist }
  it { should be_owned_by 'root'}
end

describe file('/etc/systemd/system/motherbase.consul.service') do
  it { should exist }
  it { should be_owned_by 'root'}
  its('mode') { should cmp '0644' }
end


describe service('motherbase.consul') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end