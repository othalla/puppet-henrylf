# == Class henrylf::install
#
# This class is called from henrylf for install.
#
class henrylf::install {

  package { $::henrylf::package_name:
    ensure => present,
  }
}
