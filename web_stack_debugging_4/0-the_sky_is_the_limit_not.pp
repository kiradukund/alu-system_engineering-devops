# Fixes Nginx to handle high load by increasing ULIMIT and worker connections
exec { 'fix--for-nginx':
  command => 'sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx && sed -i "s/worker_connections 768/worker_connections 4096/" /etc/nginx/nginx.conf && sed -i "s/worker_connections  768/worker_connections  4096/" /etc/nginx/nginx.conf && nginx -s reload',
  path    => '/usr/local/bin/:/bin/:/sbin/',
}
