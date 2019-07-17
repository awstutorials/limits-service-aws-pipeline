FROM openjdk:8-jdk-alpine

# Create app directory
WORKDIR /opt/app

ARG JAR_FILE

RUN apt-get update && apt-get install -y curl python python-pip jq && pip install awscli

COPY entrypoint.sh .
COPY $JAR_FILE application.jar

EXPOSE 8080

ENTRYPOINT ["sh", "entrypoint.sh"]

# VOLUME /tmp
# COPY ./target/limits-service-0.0.1-SNAPSHOT.jar app.jar
# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]