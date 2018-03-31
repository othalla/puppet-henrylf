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
class henrylf {

  $user = 'henrylf'

  $homedir = $::osfamily ? {
    'FreeBSD' => "/usr/home/${user}",
    default   => "/home/${user}"
  }
  $shell   = $::osfamily ? {
    'FreeBSD' => "/usr/local/bin/bash",
    default   => "/bin/bash"
  }

  user { $user:
    ensure     => present,
    uid        => 1001,
    gid        => 1001,
    groups     => $user,
    home       => $home,
    shell      => $shell,
    managehome => true,
    password   => '*',
    comment    => 'Henrylefourbe',
  }

  vcsrepo { "${homedir}/othaDotfiles":
    ensure   => latest,
    provider => git,
    remote   => 'origin',
    revision => 'master',
    user     => $user,
    source   => 'https://github.com/othalla/othaDotfiles.git',
  }
  package {'stow':
    ensure => latest,
  }
  #~> exec { 'Install dotfiles':
    #environment => ["HOME=${homedir}"],
    #command     => "${home}/othaDotfiles/setup.sh",
    #logoutput   => true,
    #user        => $user,
    #refreshonly => true,
  #}

}
