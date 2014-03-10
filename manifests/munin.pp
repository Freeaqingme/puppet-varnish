
class varnish::munin {

  include varnish

  package { 'libxml-parser-perll':
    notify => Exec['varnish-munin-add-plugin']
  }

  exec { 'varnish-munin-add-plugin':
    command     => 'munin-node-configure --shell 2>&1 | grep varnish | /bin/bash',
    refreshonly => true,
    require     => Package[$::varnish::package],
    notify      => Service['munin-node']
  }

}
