#
# Allow outgoing SSH connection
#
define ssh::client::firewall::allow($dst = $title, $src = 'any', $iface = 'any', $dport = 22) {
  apf::addrule { "allow-sshd-ougoing-${src}-to-${dst}":
    proto => 'tcp',
    dir   => 'out',
    dport => $dport,
    src   => $src,
    dst   => $dst,
    iface => $iface
  }
}
