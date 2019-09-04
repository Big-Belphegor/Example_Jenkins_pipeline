FROM centos:7
MAINTAINER Alien

ENV JAVA_HOME /usr/local/jdk
RUN yum install -y wget && yum clean all
RUN wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz && \
    tar zxf apache-tomcat-8.5.45.tar.gz && \
    mv apache-tomcat-8.5.45 /usr/local/tomcat && \
    rm -rf apache-tomcat-8.5.45.tar.gz /usr/local/tomcat/webapps/*

EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
