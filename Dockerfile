#
# Build stage
#
# FROM maven:3.6-openjdk-17 AS build
# COPY src src
# COPY pom.xml .
# RUN mvn -f pom.xml clean package

#
# Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=build target/portfolio-1.0-SNAPSHOT.jar /src/main/resources/aws/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/src/main/resources/aws/app.jar"]
