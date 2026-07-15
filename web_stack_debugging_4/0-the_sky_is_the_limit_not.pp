# Fixes Nginx to handle high load by increasing ULIMIT open files limit
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/:/sbin/',
}

exec { 'restart-nginx':
  command => '/etc/init.d/nginx restart',
  path    => '/usr/local/bin/:/bin/:/sbin/',
  require => Exec['fix--for-nginx'],
}
