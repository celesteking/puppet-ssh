# Class: ssh::server
#
# Configures SSH server
#
# === Parameters:
#
# [*package_state*]
#   Package version. One of (installed), absent, integer.
#
# [*daemon_port*]
#   Listen for connections on this TCP port #
#
# [*root_login*]
#   Once of yes, no or without-password
#
class ssh::server(
  $package_state = 'installed',
  $address_family = 'any',
  $listen = $ssh::params::listen_address, # []
  $port = $ssh::params::daemon_port,
  $hostkey = $ssh::params::hostkeys, # []
  $login_grace_time = $ssh::params::login_grace_time,
  $root_login = 'without-password',
  $strict_modes = true,
  $skey_auth = false,
  $pubkey_auth = true,
  $password_auth = false,
  $agent_forwarding = undef,
  $tcp_forwarding = false,
  $x11_forwarding = false,
  $reverse_lookups = false,
  $print_motd = true,
  $print_lastlog = true,
  $login_banner_path = 'none',
  $enable_sftp = true,
  $accept_env = ['LANG', 'LC_*'],
  $enable_firewall = false,
  $firewall_open_for_all = true
) inherits ssh::params {

  class {'ssh::server::install': }
    ->
  class {'ssh::server::config': }
    ~>
  class {'ssh::server::service': }
    ->
  Class['ssh::server']

}