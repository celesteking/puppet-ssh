# Make a hole in FW for $title listening address.
define ssh::server::firewall::listen_hole($dst = $title, $src = 'any', $iface = 'any') {
  apf::addrule { "allow-sshd-incoming-all-to-${dst}":
    proto => 'tcp',
    dir   => 'in',
    dport => $ssh::server::port,
    src   => $src,
    dst   => $dst,
    iface => $iface
  }
}
