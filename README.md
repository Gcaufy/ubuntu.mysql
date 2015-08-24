# ubuntu-mysql
mysql container based on ubuntu:latest

> https://github.com/DockerPool/mysql

### Build
`docker build -t ubuntu.mysql .`

### Run
`docker run -d -v /data/docker/mysql/db:/var/lib/mysql -v /data/docker/mysql/logs:/var/log/mysql -p 3306:3306 --name ubuntu.mysql ubuntu.mysql`

### View admin password
`docker logs ubuntu.mysql`

### Master and Slave Replication
`docker run -d -e REPLICATION_MASTER=true -P --name mysql ubuntu.mysql`
`docker run -d -e REPLICATION_SLAVE=true -P --link mysql:mysql ubuntu.mysql`

### Customize admin password
`docker run -d -e MYSQL_PASS="123456" ubuntu.mysql`
