# == Class henrylf::service
#
# This class is meant to be called from henrylf.
# It ensure the service is running.
#
class henrylf::service {

  service { $::henrylf::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
