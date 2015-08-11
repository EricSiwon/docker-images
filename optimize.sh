NAME=centos-dnx
ID=$(docker run -d wholroyd/$NAME:latest /bin/bash)
docker export $ID | docker import - wholroyd/optimized-$NAME:latest
