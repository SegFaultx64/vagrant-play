# Manifest for Typesafe Development Environment

package "screen" do
	action :install
end

execute 'install typesafe repository' do
	command 'sudo dpkg -i /vagrant/dependencies/packages/repo-deb-build-0002.deb'
	path ['/bin','/usr/bin']
end

execute 'apt-get update for typesafe' do
	command '/usr/bin/apt-get update'
end

package "openjdk-6-jdk" do
	action :install
end

package "typesafe-stack" do
	action :install
end

execute 'install scala' do
	command 'sudo tar -C /opt/ -xvzf /vagrant/dependencies/packages/scala.tgz'
	path ['/bin','/usr/bin']
end

package "zip" do
	action :install
end

directory "/var/play" do
	owner "root"
	group "root"
	mode 0777
	action :create
end

node['play']['app'].each do |play_app|
	execute 'get project' do
		git_url = play_app[:git]
		command "git clone -q #{git_url} temp_app && mv /var/play/temp_app/.git /var/play/app/.git"
		cwd '/var/play'
		path ['/bin','/usr/bin']
		not_if { ::Dir.entries('/var/play/app').size > 2}
	end
end

execute 'get back git' do 
	command "git reset --hard"
	cwd "/var/play/app"
	path ['/bin','/usr/bin']
	not_if { ::File.directory?('var/play/temp_app') }
end

directory "/var/play/temp_app" do
	recursive true
	action :delete
end


execute 'install play' do
	command 'sudo unzip -o /vagrant/dependencies/packages/play.zip -d /opt'
	path ['/bin','/usr/bin']
end

execute "Run play in screen" do
	command 'screen -dSm play sudo /opt/play/play run'
	cwd '/var/play/app'
end
