
class ssh::server::install {
  include ssh::params

  package { 'ssh-server':
    ensure => $ssh::server::package_state,
    name   => $ssh::params::server_package_name
  }
}
