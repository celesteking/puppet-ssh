# Class: ssh::client
#
# Configures SSH client
#
# === Parameters:
#
# [*package_state*]
#   Package version. One of (installed), absent, integer.
#
class ssh::client(
  $package_state = 'installed',
) {
  include ssh::params

  package { $ssh::params::client_package_name:
    ensure => $package_state,
    alias  => 'ssh-client'
  }

}
