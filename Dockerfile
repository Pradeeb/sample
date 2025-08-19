# ---------- Build Stage ----------
FROM maven:3.8.6-openjdk-8 AS builder

WORKDIR /build

# Copy pom.xml and download dependencies first (cache layer)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source and build
COPY src ./src
RUN mvn clean package -DskipTests

# ---------- Runtime Stage ----------
FROM openjdk:8-jre-slim

WORKDIR /app

# Copy WAR file from build stage
COPY --from=builder /build/target/sample-0.0.1-SNAPSHOT.war app.war

EXPOSE 8080

# Run the app
ENTRYPOINT ["java","-jar","app.war"]
