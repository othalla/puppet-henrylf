# == Class henrylf::config
#
# This class is called from henrylf for service config.
#
class henrylf::config {

  $user = $::henrylf::user

  file { "/etc/sudoers.d/020_${user}":
    ensure  => present,
    content => "${user} ALL=(ALL) NOPASSWD: ALL",
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
  }
  ssh_authorized_key { 'henryKey':
    ensure => present,
    user   => $user,
    type   => 'ssh-ed25519',
    key    => 'AAAAC3NzaC1lZDI1NTE5AAAAIFrQkQTDpt8KcdltshsW0+820GrCD2cVSjSEPPGHvLOG',
  }
}
