#
# Build stage
#
FROM maven:3.6-openjdk-17 AS builder
COPY src src
COPY pom.xml .
RUN mvn -f clean package -Pproduction

#
# Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=builder target/portfolio-1.0-SNAPSHOT.jar app.jar 
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
