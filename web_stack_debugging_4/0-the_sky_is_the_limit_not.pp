# Fixes Nginx to handle high load by increasing the ULIMIT open files
exec { 'fix--for-nginx':
  command => 'sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx && nginx -s reload',
  path    => '/usr/local/bin/:/bin/:/sbin/',
}
