# Class: xinetd
#
# This module manages xinetd
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#

import "service.pp"

class xinetd {
  include xinetd::params

  # local variable for use in template
  $confdir = $xinetd::params::confdir

  package {
    $xinetd::params::packagename:
      ensure => installed;
  }

  service {
    $xinetd::params::servicename:
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      require    => File["xinetd/xinetd.conf"];
  }

  file {
   "xinetd/xinetd.d":
      path    => $xinetd::params::confdir,
      ensure  => directory,
      owner   => "root",
      group   => $xinetd::params::rootgroup,
      mode    => "0755",
      notify  => Service[$xinetd::params::servicename],
      require => Package[$xinetd::params::packagename];
    "xinetd/xinetd.conf":
      path    => $xinetd::params::conffile,
      ensure  => file,
      owner   => "root",
      group   => $xinetd::params::rootgroup,
      mode    => "0644",
      content => template("xinetd/xinetd.conf.erb"),
      notify  => Service[$xinetd::params::servicename],
      require => Package[$xinetd::params::packagename];
  }

}
