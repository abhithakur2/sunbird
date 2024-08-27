# Use a base image with Java 11
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory
WORKDIR /app
# Copy the JAR file to the container
COPY target/mimoto-0.12.0.jar mimoto.jar
# Expose the port that your Spring Boot application listens on (default is 8080)
EXPOSE 8089
# Define the command to run your application
#CMD ["java", "-jar", "app.jar"]
ENTRYPOINT ["java", "-Dspring.profiles.active=local", "-jar", "mimoto.jar"]

