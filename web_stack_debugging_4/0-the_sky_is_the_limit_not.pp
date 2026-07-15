# Fixes Nginx to handle high load by increasing the ULIMIT
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx && nginx -s reload',
  path    => '/usr/local/bin/:/bin/:/sbin/',
}
