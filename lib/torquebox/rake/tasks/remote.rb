require 'rake'
require 'torquebox/deploy_utils'
require 'torquebox/remote_deploy_utils'

namespace :torquebox do
  namespace :remote do

    desc "Upload this application to the remote server as an archive file"
    task :stage => ["torquebox:archive"] do
      archive_name = TorqueBox::DeployUtils.archive_name
      TorqueBox::RemoteDeployUtils.stage(archive_name)
    end

    desc "Execute Ruby commands against the remote application"
    task :exec, [:cmd] do |t, args|
      cmd = args[:cmd]
      archive_name = TorqueBox::DeployUtils.archive_name
      TorqueBox::RemoteDeployUtils.exec_ruby(archive_name, cmd)
    end

    desc "Deploy the archive file to the remote TorqueBox server"
    task :deploy do
      archive_name = TorqueBox::DeployUtils.archive_name
      TorqueBox::RemoteDeployUtils.deploy(archive_name)
    end

    desc "Undeploy the archive file to the remote TorqueBox server"
    task :undeploy do
      archive_name = TorqueBox::DeployUtils.archive_name
      TorqueBox::RemoteDeployUtils.undeploy(archive_name)
    end
  end
end
