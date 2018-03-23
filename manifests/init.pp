# Class: henrylf
# ===========================
#
# Full description of class henrylf here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class henrylf (
  $package_name = $::henrylf::params::package_name,
  $service_name = $::henrylf::params::service_name,
) inherits ::henrylf::params {

  # validate parameters here

  class { '::henrylf::install': } ->
  class { '::henrylf::config': } ~>
  class { '::henrylf::service': } ->
  Class['::henrylf']
}
