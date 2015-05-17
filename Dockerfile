FROM centos:centos7

RUN rpm -Uvh http://repo.rundeck.org/latest.rpm
RUN yum -y update
RUN yum -y install java-1.8.0-openjdk rundeck
RUN yum -y clean all

CMD source /etc/rundeck/profile && ${JAVA_HOME:-/usr}/bin/java ${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck ${RDECK_HTTP_PORT}
EXPOSE 4440
VOLUME /etc/rundeck
