#Docker examples to start tomcat


```shell
docker run -d -t -i -p 8080:8080 \
   -e JAVA_OPTS='-Xms1g -Xmx1g' \
   -e CATALINA_OPTS='-XX:+UseG1GC -XX:MaxPermSize=256M -XX:InitiatingHeapOccupancyPercent=75 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=15555 -Xloggc:/var/log/java/gc.log -XX:+PrintGCDateStamps'
   --name tomcat-ui1 kadamonkar/tomcat
```


```shell
docker run -d -t -i -p 8181:8080 \
   -e JAVA_OPTS='-Xms4g -Xmx4g -Djava.security.krb5.conf=/opt/tomcat/webapps/api/WEB-INF/classes/krb5.ini' \
   -e CATALINA_OPTS='-XX:+UseG1GC -XX:MaxPermSize=256M' \ 
   --name tomcat-ui2 kadamonkar/tomcat
```


#References

HOW-TO IN DOCKER
https://docs.docker.com/engine/reference/run/#/env-environment-variables 

HOW-TO IN KUBERNETES
http://stackoverflow.com/questions/33478555/kubernetes-equivalent-of-env-file-in-docker
