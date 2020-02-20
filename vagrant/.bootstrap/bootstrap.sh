#!/usr/bin/env bash

apt-get update
apt-get install -y apache2

echo "<html>
<header><title>This is title</title></header>
<body>
Hello world
</body>
</html>
" > /var/www/index.html
service  apache2 reload 
