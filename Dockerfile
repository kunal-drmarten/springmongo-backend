FROM openjdk:24-jdk-slim
VOLUME /tmp
COPY target/SpringMongoProject-0.0.1-SNAPSHOT.jar SpringMongoProject-0.0.1-SNAPSHOT.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/SpringMongoProject-0.0.1-SNAPSHOT.jar"]
