FROM jboss/wildfly:23.0.2.Final

MAINTAINER "Adalberto" "mario555beltran@gmail.com"
USER root
COPY org /opt/jboss/wildfly/modules/
RUN /opt/jboss/wildfly/bin/add-user.sh root root --silent
ADD standalone.xml /opt/jboss/wildfly/standalone/configuration/
ADD test01-1.0-SNAPSHOT.war /opt/jboss/wildfly/standalone/deployments/

# JBoss ports
EXPOSE 8080 9990 8009 8443

RUN mkdir /home/user
RUN mkdir /home/user/Descargas/
ADD mariadb-java-client-3.0.7.jar /home/user/Descargas/
ADD primefaces-11.0.0.jar /home/user/Descargas/
ADD Pool.txt /home/user/Descargas/
ADD module_primefaces.txt /home/user/Descargas/

ENTRYPOINT /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 -c standalone.xml

#CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone.xml"]
