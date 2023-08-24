From openjdk:8-jre-alpine
workdir /web
copy ./main /app
expose 8080
entrypoint ["java", "/app"]
