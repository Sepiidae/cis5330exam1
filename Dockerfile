# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
FROM maven:3-jdk-11 as build

RUN mkdir /src
COPY pom.xml /src/
COPY src /src/src

RUN cd /src && mvn package

RUN ls /src/target
RUN ls /src
RUN find /src
FROM tomcat:8

COPY --from=build /src/target/CIS5530exam1-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

