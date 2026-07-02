# Load Balancer

This project configures a load balancer using HAProxy with round-robin
distribution across two Nginx web servers, each returning a custom
X-Served-By header containing their hostname.
