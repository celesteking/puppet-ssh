#
# Authorize ssh access for an user by his pubkey
#
# Parameters:
#
# Examples:
#   ssh::auth::key {'testuser': key => 'abcdefFF'}
#
define ssh::auth::key($key, $type = 'rsa', $username = $title, $ensure = present, $comment = 'default') {
  $safe_comment = regsubst($comment, '[^[\\w\\-]]+', '-', 'G')

  ssh_authorized_key { "${username}@${safe_comment}":
    ensure => $ensure,
    key    => $key,
    user   => $username,
    type   => $type,
  }
}
