# == Class henrylf::params
#
# This class is meant to be called from henrylf.
# It sets variables according to platform.
#
class henrylf::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'henrylf'
      $service_name = 'henrylf'
    }
    'RedHat', 'Amazon': {
      $package_name = 'henrylf'
      $service_name = 'henrylf'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
