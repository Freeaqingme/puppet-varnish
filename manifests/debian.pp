
class varnish::debian
{
  
  firewall::rule { 'varnish-apt':
    destination    => 'repo.varnish-cache.org',
    destination_v6 => 'repo.varnish-cache.org',
    protocol       => 'tcp',
    port           => 80,
    direction      => 'output'
  }

  apt::repository { 'varnish':
    url        => 'http://mirrors.nl.kernel.org/debian/',
    distro     => $::lsbdistcodename,
    repository => 'varnish-3.0',
    key_url    => 'http://repo.varnish-cache.org/debian/GPG-key.txt',
    key        => 'C4DEFFEB',
  }
  
}
