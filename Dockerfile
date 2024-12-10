# Use an OpenJDK image as base
FROM maven:3.8.5-openjdk-24-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and the source code to the container (adjust the source directory accordingly)
COPY . /app

# Run the Maven clean install command and skip tests
RUN mvn clean install -DskipTests

# Use a slim OpenJDK image for the runtime
FROM openjdk:24-jdk-slim

# Set the working directory to /tmp
VOLUME /tmp

# Copy the generated JAR file from the build stage
COPY --from=build /app/target/SpringMongoProject-0.0.1-SNAPSHOT.jar SpringMongoProject-0.0.1-SNAPSHOT.jar

# Expose the port the app will run on
EXPOSE 8081

# Set the entry point to run the JAR file
ENTRYPOINT ["java", "-jar", "/SpringMongoProject-0.0.1-SNAPSHOT.jar"]
