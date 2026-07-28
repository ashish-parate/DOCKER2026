# DOCKER2026
docker 
docker run 

docker run -d  in detached way

docker ps list all container

docker run -p 80:80  '-p for expose'

docker run -P  '-P for random port {32768 to 65535}'

docker rm  "remove"

docker kill  "kill container"

docker rm -f  "remove running cont"(forcefully)

docker ps -q "list only id"

docker rm -f docker ps -q "remove all running cont"

docker create  "create the container"

docker start "start cont"

cat /proc/meminfo "memory info "

cat /etc/os-release "os show"

docker exec "command inside the container "

docker exec -it bash "to enter the container"

docker image

docker pull

git clone https://github.com/ashish-parate/docker.git ls cd docker/ ls docker build Dockerfile docker build . ls

docker system prune clear docker build . docker ps 97 docker ps -a 98 docker images 99 docker run 063 100 docker images 101 docker run -p 80:80 063 ordocker run -d -p 80:80 86ab

102 docker images 103 docker ps 104 docker run -p 80:80 063 105 docker ps 106 docker images docker run -d -p 80:80 063 docker ps

docker commit id
