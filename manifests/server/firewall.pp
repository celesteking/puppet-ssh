#
# Class: ssh::server::firewall
#
# Manages openssh firewalling using custom Firewall wrapper
# By default it opens openssh's default port(s) to everybody.
#
class ssh::server::firewall {
  include ssh::params

  # ssh::server required
  anchor { 'ssh:server::firewall::begin':
    require => Class['ssh::server', 'apf']
  }

  if $ssh::server::firewall_open_for_all {
    ssh::server::firewall::listen_hole { $ssh::server::listen:
      require => Anchor['ssh:server::firewall::begin']
    }
  }
}
