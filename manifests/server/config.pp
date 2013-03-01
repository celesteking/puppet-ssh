# Class: ssh::server::config
class ssh::server::config {
  include ssh::params

  if $ssh::server::address_family !~ /^(inet6?|any)$/ {
    fail('address_family must be one of any, inet, inet6')
  }

  file { 'ssh-server-config':
    path    => $ssh::params::config_file,
    mode    => $ssh::params::config_file_mode,
    owner   => root,
    group   => 0,
    content => template('ssh/sshd_config.erb')
  }

}