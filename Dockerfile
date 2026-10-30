FROM maven:3.9-amazoncorretto-25 AS build
WORKDIR /app
COPY . .
RUN mvn -B -DskipTests package

FROM amazoncorretto:25-alpine
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]