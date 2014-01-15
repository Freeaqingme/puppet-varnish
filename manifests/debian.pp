
class varnish::debian
{
  if $varnish::bool_firewall {
     # The before=> entry is not too relevant given that you need 
     # Service['iptables'] probably
    firewall::rule { 'varnish-apt':
      destination    => 'repo.varnish-cache.org',
      destination_v6 => 'repo.varnish-cache.org',
      protocol       => 'tcp',
      port           => 80,
      direction      => 'output',
      before         => Apt::Repository['varnish']
    }
  }

  apt::repository { 'varnish':
    url        => 'http://repo.varnish-cache.org/debian/',
    distro     => $::lsbdistcodename,
    repository => 'varnish-3.0',
    key_url    => 'http://repo.varnish-cache.org/debian/GPG-key.txt',
    key        => 'C4DEFFEB',
    before     => Package['varnish'],
  }
  
}
