class xinetd::params {

  case $operatingsystem {
    "Ubuntu":  {
      $confdir     = "/etc/xinetd"
      $conffile    = "/etc/xinetd.conf"
      $packagename = "xinetd"
      $servicename = "xinetd"
      $rootgroup   = "root"
    }
    "Solaris": {
      fail("xinetd: module does not support Solaris")
    }
    "FreeBSD": {
      $confdir     = "/usr/local/etc/xinetd.d"
      $conffile    = "/usr/local/etc/xinetd.conf"
      $packagename = "security/xinetd"
      $servicename = "xinetd"
      $rootgroup   = "wheel"
    }
    default:   {
      $confdir     = "/etc/xinetd"
      $conffile    = "/etc/xinetd.conf"
      $packagename = "xinetd"
      $servicename = "xinetd"
      $rootgroup   = "root"
    }
  }

}

