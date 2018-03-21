
FROM kadamonkar/oracle-jdk-docker
MAINTAINER Onkar Kadam, onkar.kadam@outlook.com

ARG TOMCAT_VERSION

COPY /apache-tomcat-${TOMCAT_VERSION} /opt/tomcat

ENV CATALINA_BASE="/opt/tomcat"
ENV CATALINA_HOME="/opt/tomcat"
ENV JAVA_OPTS="-Xms1g -Xmx1g"
ENV CATALINA_OPTS="-XX:+UseG1GC -XX:MaxPermSize=256M -XX:InitiatingHeapOccupancyPercent=75 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=15555 -Xloggc:/var/log/java/gc.log -XX:+PrintGCDateStamps"

EXPOSE 8080

CMD ["/bin/bash", "/opt/tomcat/bin/catalina.sh", "run"]
