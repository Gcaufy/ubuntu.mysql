FROM ubuntu

MAINTAINER Gcaufy <gcaufy@gmail.com>

RUN apt-get update && apt-get -yq install mysql-server-5.7 pwgen

RUN rm -rf /var/lib/apt/lists/* && rm -rf /var/lib/mysql/*

ADD conf/my.cnf /etc/mysql/conf.d/my.cnf

ADD conf/mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf

ADD scripts/import_sql.sh /import_sql.sh
ADD scripts/run.sh /run.sh

RUN chmod 755 /*.sh
RUN chown -R mysql.mysql /var/log/mysql

ENV MYSQL_USER admin
ENV MYSQL_PASS **Random**

ENV REPLICATION_MASTER **False**
ENV REPLICATION_SLAVE **False**
ENV REPLICATION_USER replica
ENV REPLICATION_PASS replica

VOLUME ["/var/lib/mysql", "/var/log/mysql"]

EXPOSE 3306
CMD ["/run.sh"]
