FROM maven:3.3.9 as builder

WORKDIR /build

COPY . .

RUN mvn -B package

FROM openjdk:8
COPY --from=builder /build/target/users-mysql.jar users-mysql.jar
EXPOSE 8086
ENTRYPOINT ["java", "-jar", "users-mysql.jar"]
