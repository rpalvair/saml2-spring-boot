FROM maven:3.8.3-openjdk-17 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:latest
COPY --from=build /home/app/target/saml2-spring-boot-1.0.0-SNAPSHOT.jar saml2-spring-boot-1.0.0-SNAPSHOT.jar
ENTRYPOINT ["sh","-c","java -jar saml2-spring-boot-1.0.0-SNAPSHOT.jar"]