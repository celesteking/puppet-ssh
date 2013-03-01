
# Allow remote peer connect to our ssh server.
#
# Parameters
#
# [*src*]
#   Remote peer address
#
# [*iface*]
#   interface name
#
define ssh::server::firewall::allow_peer($src = 'any', $iface = 'any'){
  apf::addrule { "allow-sshd-incoming-from-peer-${src}":
    proto => 'tcp',
    dir   => 'in',
    dport => $ssh::server::port,
    src   => $src,
    dst   => '0.0.0.0/0',
    iface => $iface
  }
}
