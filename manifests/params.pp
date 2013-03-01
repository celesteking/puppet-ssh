class ssh::params {

  $lib_prefix = $::architecture ? {
    'x86_64' => 'lib64',
    default => 'lib'
  }

  $client_package_name = $::osfamily ? {
    default => 'openssh-client'
  }

  $server_package_name = $::osfamily ? {
    default => 'openssh-server'
  }

  $service_name = $::osfamily ? {
    'Debian' => 'ssh',
    default  => 'sshd',
  }

  $service_has_status = $::osfamily ? {
    default => true
  }

  $config_dir = '/etc/ssh'
  $config_file = "${config_dir}/sshd_config"
  $config_file_mode = 440

  $daemon_port = 22

  $listen_address = $::osfamily ? {
    default => ['0.0.0.0', '::']
  }

  $sftp_path = $::osfamily ? {
    'Debian' => "/usr/${lib_prefix}/misc/sftp-server",
    default => '/usr/libexec/openssh/sftp-server'
  }

  $hostkeys = ['/etc/ssh/ssh_host_rsa_key', '/etc/ssh/ssh_host_dsa_key']

  $login_grace_time = 20

}
