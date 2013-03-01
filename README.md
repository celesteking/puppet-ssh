
Puppet SSH Module
=================

Module for configuring ssh.

Usage
-----

The `ssh::client` class installs the ssh client:

    include ssh::client

The `ssh::server` class installs and configures the sshd:

    include ssh::server

You can specify the port the sshd should listen to by including the class
with this special syntax:

    class { "ssh::server":
      port => 20009,
    }

You can use `ssh::auth::key` to add an authorized ssh key to an existing user
for effortless authentication with ssh:

    ssh::auth::key { "someuser":
      key => "deadBeefSomeRsaKey==",
      comment => "usercomment",
    }
