# Usa una imagen base de Java
FROM openjdk:17-jdk-slim

# Crea un directorio de trabajo
WORKDIR /app

# Copia el archivo .jar generado por Spring Boot
COPY target/menu-pedidos-api.jar app.jar

# Ejecuta la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]