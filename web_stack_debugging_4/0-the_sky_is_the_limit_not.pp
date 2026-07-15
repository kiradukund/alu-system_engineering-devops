# Fixes Nginx to handle high load by increasing ULIMIT open files limit
exec { 'fix--for-nginx':
  command => 'sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/:/sbin/',
}

exec { 'fix-worker-connections':
  command => 'sed -i "s/worker_connections 768/worker_connections 4096/" /etc/nginx/nginx.conf',
  path    => '/usr/local/bin/:/bin/:/sbin/',
}

exec { 'reload-nginx':
  command => 'nginx -s reload',
  path    => '/usr/local/bin/:/bin/:/sbin/',
  require => [Exec['fix--for-nginx'], Exec['fix-worker-connections']],
}
