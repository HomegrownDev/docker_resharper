FROM openjdk:latest

COPY startup.sh ./
RUN mkdir /usr/resharper \
    && wget "https://download.jetbrains.com/lcsrv/license-server-installer.zip" -P /usr/resharper \
    && unzip /usr/resharper/license-server-installer.zip -d /usr/resharper \
    && /usr/resharper/bin/license-server.sh configure --port 8080
EXPOSE 8080

#Starts ReSharper script that queries the service status every 15 seconds
ENTRYPOINT [ "/startup.sh" ]