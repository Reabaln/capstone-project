# syntax=docker/dockerfile:experimental
FROM maven:3-jdk-11 as build

WORKDIR /tmp
COPY src /tmp/src
COPY pom.xml /tmp/
RUN --mount=type=cache,id=maven,target=/root/.m2,sharing=shared mvn clean package


FROM adoptopenjdk/openjdk11:alpine

COPY --from=build /tmp/target/queue-master.jar /queue-master.jar
RUN chmod a+rx ./queue-master.jar


USER ${SERVICE_USER}

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","./queue-master.jar", "--port=80"]
