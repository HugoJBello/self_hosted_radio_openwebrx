# nuevo user

docker exec -it openwebrx python3 /opt/openwebrx/openwebrx.py admin adduser admin


# nginx conf



    # Página principal y rutas bajo el subpath
    location /radio/ {
        rewrite ^/radio/(.*)$ /$1 break;

        proxy_pass http://127.0.0.1:8073;
        proxy_http_version 1.1;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # WebSocket / conexiones en tiempo real
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        proxy_read_timeout 3600;
        proxy_send_timeout 3600;
        proxy_buffering off;
    }

