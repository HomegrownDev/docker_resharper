FROM openjdk:14-slim
ADD https://download.jetbrains.com/lcsrv/license-server-installer.zip /usr/
COPY startup.sh ./
RUN apt-get update \
    && apt-get install unzip \
    && mkdir /usr/resharper \
    && unzip /usr/license-server-installer.zip -d /usr/resharper \
    && /usr/resharper/bin/license-server.sh configure --port 8080
EXPOSE 8080

#Starts ReSharper script that queries the service status every 15 seconds
ENTRYPOINT [ "/startup.sh" ]