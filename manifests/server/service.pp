# Class: ssh::server::service
class ssh::server::service {
  include ssh::params

  service { 'ssh-server':
    ensure    => running,
    name      => $ssh::params::service_name,
    enable    => true,
    hasstatus => $ssh::params::service_has_status,
  }
}
