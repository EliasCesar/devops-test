FROM openjdk:16-alpine3.13
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG JAR_FILE=springboot-docker/target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]