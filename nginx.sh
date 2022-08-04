#!/bin/bash
sudo amazon-linux-extras install -y nginx1


cat << EOF | sudo tee /etc/nginx/conf.d/hello.conf
server {
    listen 8080;
    listen [::]:8080;

    location / {
        default_type text/plain;
        expires -1;
        return 200 'Server address: \$server_addr:\$server_port\nServer name: \$hostname\nDate: \$time_local\nURI: \$request_uri\nRequest ID: \$request_id\n';
    }
}
EOF

sudo systemctl start nginx
sudo systemctl enable nginx
