# docker_resharper
## Image for JetBrains Resharper Floating License Server

For organizations that utilize the relatively lightweight JetBrains ReSharper license server, this is an attractive alternative to a full windows or linux server installation. This dockerfile generates an approximately 800mb imaage, that is a full JDK environment and is based of the OpenJDK 8 image. The dockerfile pulls, installs, and configures the latest JetBrains server upon build. Once build, just the `startup.sh` file runs via `ENTRYPOINT` which starts and runs the service, and then queries it every 15 seconds and keeps the container alive on session *PID 1*.
